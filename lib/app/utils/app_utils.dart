import 'package:chatting_app/app/constants/app_constants.dart';
import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/error/failure.dart';
import 'extensions.dart';

@immutable
class AppUtils {
  const AppUtils._();

  static String? parseFailureMessage(Failure failure) {
    if (failure is CacheFailure) {
      return 'errors.cacheError'.tr();
    }
    if (failure is ServerFailure) {
      return 'errors.serverError'.tr();
    }
    if (failure is TimeoutFailure) {
      return 'errors.network.timeout'.tr();
    }
    if (failure is TimeoutFailure) {
      return 'errors.network.timeout'.tr();
    }
    if (failure is UnknownFailure) {
      return failure.message;
    }
    return null;
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
    if (list.isEmpty) {
      return [];
    }
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
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => toEntity(item)).toList();
  }

  /// mergeBy
  /// Example:
  /// ```dart
  ///   final merged = mergeBy<Entity, int>(
  ///     currentList,
  ///     incomingList,
  ///     getId: (m) => m.id,
  ///   );
  ///```
  static List<T> mergeBy<T, K>(
    List<T> current,
    List<T> incoming, {
    required K Function(T item) getId,
    bool descending = true,
  }) {
    final map = <K, T>{
      for (final item in current) getId(item): item,
      for (final item in incoming) getId(item): item,
    };

    return map.values.toList()..sort((a, b) {
      final keyA = getId(a) as Comparable;
      final keyB = getId(b) as Comparable;
      return descending
          ? Comparable.compare(keyB, keyA)
          : Comparable.compare(keyA, keyB);
    });
  }

  static String getReactionSymbol(ReactionType type) => switch (type) {
    ReactionType.like => AppConstants.reactions[0],
    ReactionType.dislike => AppConstants.reactions[1],
  };

  static ReactionType getReactionTypeBySymbol(String symbol) {
    if (symbol == AppConstants.reactions[0]) {
      return ReactionType.like;
    }
    if (symbol == AppConstants.reactions[1]) {
      return ReactionType.dislike;
    }
    return ReactionType.like;
  }

  static RenderSliverMultiBoxAdaptor? findSliverAdapter(
    RenderObject? renderObject,
  ) {
    if (renderObject == null) return null;
    if (renderObject is RenderSliverMultiBoxAdaptor) return renderObject;

    RenderSliverMultiBoxAdaptor? result;
    renderObject.visitChildren((child) {
      if (result != null) return;
      result = findSliverAdapter(child);
    });

    return result;
  }

  static BoxConstraints getModalDialogConstraints(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isLandscape = context.isLandscape();
    return BoxConstraints(
      maxHeight: isLandscape
          ? screenSize.height - 32.0
          : screenSize.height * 0.7,
      maxWidth: isLandscape
          ? screenSize.height - 32.0
          : screenSize.width - 32.0,
    );
  }

  static bool isBottomOfList(ScrollController scrollController) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  static String getSupportedImageExtension(String? fileName) {
    final extension = fileName?.split('.').last.toLowerCase();

    return switch (extension) {
      'png' || 'webp' => extension!,
      _ => 'jpg',
    };
  }

  static String normalizeFileName(String originalName, String ext) {
    final base = originalName.split('.').first;

    return '$base.$ext';
  }
}
