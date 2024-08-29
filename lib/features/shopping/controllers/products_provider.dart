import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pcnc_task/features/auth/controllers/token_manager.dart';
import 'package:pcnc_task/features/auth/models/user.dart';
import 'package:pcnc_task/features/shopping/models/products.dart';
import 'package:pcnc_task/global/widgets/toast.dart';
import 'package:pcnc_task/services/end_points.dart';
import 'package:pcnc_task/services/requester.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _all_products = [];

  get all_products {
    return _all_products ?? [];
  }

  List<Product> _random_products = [];

  get random_products {
    return _random_products ?? [];
  }

  List<Product> _trend_products = [];

  get trend_products {
    return _trend_products ?? [];
  }

  bool isLoadingAllProducts = false;
  Future<void> getAllProducts() async {
    try {
      if (isLoadingAllProducts) {
        return;
      }
      isLoadingAllProducts = true;
      final response = await Requester.getRequest(
        EndPoints.all_products(),
      );
      notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        print('data : ${data[0]}');
        _all_products = data.map<Product>((e) => Product.fromJson(e)).toList();
      } else {
        AppToast.showToast('failed ${response.data}');
      }
      isLoadingAllProducts = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoadingAllProducts = false;
      AppToast.showToast('$e');
      return;
    }
  }

  bool isLoadingRandomProducts = false;
  Future<void> getRandomProducts() async {
    try {
      if (isLoadingRandomProducts) {
        return;
      }
      isLoadingRandomProducts = true;
      final response = await Requester.getRequest(
        EndPoints.random_products(),
      );
      notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        print('data : ${data[0]}');
        _random_products =
            data.map<Product>((e) => Product.fromJson(e)).toList();
      } else {
        AppToast.showToast('failed ${response.data}');
      }
      isLoadingRandomProducts = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoadingRandomProducts = false;
      AppToast.showToast('$e');
      return;
    }
  }

  bool isLoadingTrendProducts = false;
  Future<void> getTrendProducts() async {
    try {
      if (isLoadingTrendProducts) {
        return;
      }
      isLoadingTrendProducts = true;
      final response = await Requester.getRequest(
        EndPoints.random_products(), // no api for trend
      );
      notifyListeners();
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data;
        print('data : ${data[0]}');
        _trend_products =
            data.map<Product>((e) => Product.fromJson(e)).toList();
      } else {
        AppToast.showToast('failed ${response.data}');
      }
      isLoadingTrendProducts = false;
      notifyListeners();
    } catch (e) {
      print('error: $e');
      isLoadingTrendProducts = false;
      AppToast.showToast('$e');
      return;
    }
  }
}
