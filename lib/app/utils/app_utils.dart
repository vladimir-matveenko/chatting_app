import 'dart:convert';

import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/error/failure.dart';

class AppUtils {
  static String? parseFailureMessage(Failure failure) {
    if (failure is CacheFailure) {
      return 'errors.cacheError'.tr();
    }
    if (failure is CacheFailure) {
      return 'errors.assetError'.tr();
    }
    if (failure is UnknownFailure) {
      return failure.message;
    }
    return null;
  }

  static Map<String, dynamic> parseJson(String text) {
    final match = RegExp(r'\{[\s\S]*\}').firstMatch(text);

    if (match == null) {
      throw Exception('JSON not found in Gemini response');
    }

    final jsonString = match.group(0)!;

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static String getFirstLetter(String name) {
    if (name.isEmpty) return '';
    return name.substring(0, 1);
  }

  static String getFirstName(String name) {
    if (name.isEmpty) return '';
    return name.split(' ').first;
  }

  static String getLastName(String name) {
    if (name.isEmpty) return '';
    return name.split(' ').last;
  }

  static String? fieldRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'fieldValidation.fieldIsRequired'.tr();
    }
    return null;
  }

  static List<T> parseList<T>(
    List<dynamic> list,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return list
        .map((jsonItem) => fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }

  /// listModelToListEntity
  /// convert List of models to List of entities
  /// Example:
  /// ```dart
  /// List<ItemModel> models = [...];
  ///
  /// List<ItemEntity> entities = listModelToListEntity<ItemModel,
  /// ItemEntity>(models, (item) => item.toEntity());
  ///```
  static List<T> listModelToListEntity<E, T>(
    List<E> list,
    T Function(E) toEntity,
  ) {
    return list.map((item) => toEntity(item)).toList();
  }

  static IconData getReactionIcon(ReactionType type) => switch (type) {
    ReactionType.like => Icons.thumb_up,
    ReactionType.dislike => Icons.thumb_down,
  };
}
