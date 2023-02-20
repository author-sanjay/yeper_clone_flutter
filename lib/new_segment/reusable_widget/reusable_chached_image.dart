import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


CachedNetworkImage reusableChachedImage( String url) {
    return CachedNetworkImage(
      imageUrl:    url,
                                    filterQuality: FilterQuality.medium,
                                      progressIndicatorBuilder:
                                      (context, url, progress) {
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