// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoadingService extends StatelessWidget {
  const ImageLoadingService({
    Key? key,
    required this.imgUrl,
    this.borderRadius,
    required this.loadingWidget,
  }) : super(key: key);
  final String imgUrl;
  final BorderRadius? borderRadius;
  final Widget loadingWidget;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: imgUrl,
        placeholder: (context, url) => Shimmer.fromColors(
            child: loadingWidget,
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100),
        placeholderFadeInDuration: Duration(microseconds: 500),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
