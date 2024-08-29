import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';

class AppImage extends StatelessWidget {
  AppImage(this.url);
  String url;

  openFullSCreen(context) {
    FullscreenImageViewer.open(
      context: context,
      child: Hero(
        tag: 'hero',
        child: CachedNetworkImage(
          imageUrl: url,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openFullSCreen(context);
      },
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Icon(Icons.image),
      ),
    );
    // WidgetZoom(
    //   heroAnimationTag: 'tag',
    //   zoomWidget: CachedNetworkImage(
    //     imageUrl: url,
    //     fit: BoxFit.cover,
    //     errorWidget: (context, url, error) => Icon(Icons.image),
    //   ),
    // );
  }
}
