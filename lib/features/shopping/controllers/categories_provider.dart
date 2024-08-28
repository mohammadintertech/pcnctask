import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/features/shopping/models/category.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:pcnc_task/services/end_points.dart';
import 'package:pcnc_task/services/requester.dart';

class CategoryProvider with ChangeNotifier {
  List<AppCategory> _cats = [];
  get cats {
    return _cats ?? [];
  }

  bool isLoadingCats = false;
  Future<void> getCategories() async {
    try {
      if (isLoadingCats) {
        return;
      }
      isLoadingCats = true;
      final response = await Requester.getRequest(
        EndPoints.categories(),
      );
      notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        print('data : ${data[0]}');
        _cats =
            data.map<AppCategory>((cat) => AppCategory.fromJson(cat)).toList();
      } else {
        AppToast.showToast('failed ${response.data}');
      }
      isLoadingCats = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoadingCats = false;
      AppToast.showToast('$e');
      return;
    }
  }
}
