import 'dart:developer';

import 'package:chatting_app/app/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../domain/entity/app_image_entity.dart';

@immutable
class ImageService {
  const ImageService._();

  static const _maxImageSize = 1024;

  static Future<AppImageEntity?> getImageFromGallery() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (picked == null) return null;

    try {
      log('bytes reading started');
      final bytes = await picked.readAsBytes();
      log('bytes read');

      final normalizedBytes = await compute(
        _normalizeImage,
        _NormalizeImageParams(bytes: bytes, originalName: picked.name),
      );

      final fileName = _normalizeFileName(picked.name);

      return AppImageEntity(bytes: normalizedBytes, name: fileName);
    } catch (e) {
      log('getImageFromGallery error: $e');
      return null;
    }
  }

  static Uint8List _normalizeImage(_NormalizeImageParams params) {
    try {
      final image = img.decodeImage(params.bytes);

      if (image == null) {
        return params.bytes;
      }

      final normalized = img.bakeOrientation(image);

      final resized = _resizeImage(normalized);

      final ext = _getExtension(params.originalName);

      return _encode(resized, ext);
    } catch (e) {
      log('normalizeImage error: $e');
      return params.bytes;
    }
  }

  static img.Image _resizeImage(img.Image image) {
    final maxSide = image.width.max(image.height);

    if (maxSide <= _maxImageSize) {
      return image;
    }

    if (image.width >= image.height) {
      return img.copyResize(image, width: _maxImageSize, maintainAspect: true);
    }

    return img.copyResize(image, height: _maxImageSize, maintainAspect: true);
  }

  static Uint8List _encode(img.Image image, String ext) {
    switch (ext) {
      case '.png':
        return Uint8List.fromList(img.encodePng(image));

      case '.bmp':
        return Uint8List.fromList(img.encodeBmp(image));

      case '.gif':
        return Uint8List.fromList(img.encodeGif(image));

      default:
        return Uint8List.fromList(img.encodeJpg(image, quality: 90));
    }
  }

  static String _getExtension(String? name) {
    if (name == null || !name.contains('.')) {
      return '.jpg';
    }

    return '.${name.split('.').last.toLowerCase()}';
  }

  static String _normalizeFileName(String originalName) {
    final base = originalName.split('.').first;
    final ext = _getExtension(originalName);

    return '$base$ext';
  }
}

class _NormalizeImageParams {
  const _NormalizeImageParams({
    required this.bytes,
    required this.originalName,
  });

  final Uint8List bytes;
  final String originalName;
}
