import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

CachedNetworkImage reusableChachedImage(String url,
    [BoxFit fit = BoxFit.contain]) {
  return CachedNetworkImage(
    imageUrl: url,
    filterQuality: FilterQuality.medium,
   fit: fit,
    progressIndicatorBuilder: (context, url, progress) {
      return Center(
        child: Shimmer.fromColors(
          child: Text("Fetching Image..."),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
        ),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
