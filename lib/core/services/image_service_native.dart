import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import '../domain/entity/app_image_entity.dart';

@immutable
class ImageService {
  const ImageService._();

  static const _maxImageSize = 1024.0;
  static const _quality = 90;

  static Future<AppImageEntity?> getImageFromGallery() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: _maxImageSize,
      maxHeight: _maxImageSize,
      imageQuality: _quality,
    );

    if (picked == null) return null;

    try {
      final bytes = await picked.readAsBytes();

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

      return _encode(normalized);
    } catch (e) {
      log('normalizeImage error: $e');
      return params.bytes;
    }
  }

  static Uint8List _encode(img.Image image) {
    return Uint8List.fromList(img.encodeJpg(image));
  }

  static String _normalizeFileName(String originalName) {
    final base = originalName.split('.').first;

    return '$base.jpg';
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
