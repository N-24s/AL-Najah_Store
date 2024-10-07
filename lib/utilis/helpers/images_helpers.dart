import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageHandler extends StatelessWidget {
  final dynamic imageSource;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageHandler({
    Key? key,
    required this.imageSource, 
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     if (imageSource == null) {
      return _nullImageWidget(context);
    }
    if (imageSource is File) {
      return Image.file(
        imageSource,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: _errorWidget,
      );
    } else if (imageSource is String) {
      if (_isNetworkUrl(imageSource)) {
        return CachedNetworkImage(
          imageUrl: imageSource,
          width: width,
          height: height,
          fit: fit,
          // placeholder: (context, url) => _loadingPlaceholder(context),
          errorWidget: (context, url, error) => _errorWidget(context, error, null),
        );
      } else {
        return Image.asset(
          imageSource,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: _errorWidget,
        );
      }
    } else if (imageSource is Uint8List) {
      return Image.memory(
        imageSource,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: _errorWidget,
      );
    } else {
      return _errorWidget(context, null, null);
    }
  }

  bool _isNetworkUrl(String url) {
    return url.startsWith('http') || url.startsWith('https');
  }

  Widget _loadingPlaceholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade300,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

   Widget _nullImageWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade300,
      child: const Icon(
        Icons.image_not_supported, 
        color: Colors.grey,
      ),
    );
  }

  Widget _errorWidget(BuildContext context, Object? error, StackTrace? stackTrace) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade300,
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
      ),
    );
  }
}


