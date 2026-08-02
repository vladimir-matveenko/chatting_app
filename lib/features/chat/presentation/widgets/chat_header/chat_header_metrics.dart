import 'package:flutter/material.dart';

@immutable
abstract final class ChatHeaderMetrics {
  const ChatHeaderMetrics._();

  // ---------------------------------------------------------------------------
  // Layout
  // ---------------------------------------------------------------------------

  /// Отступ сверху до большого аватара.
  static const double topPadding = 32.0;

  /// Размер большого аватара.
  static const double avatarSize = 88.0;

  /// Отступ между блоками.
  static const double spacing = 16.0;

  /// Высота строки с названием чата.
  static const double titleHeight = 32.0;

  /// Высота строки с подзаголовком.
  static const double subtitleHeight = 20.0;

  /// Высота панели действий.
  static const double actionBarHeight = 72.0;

  /// Нижний отступ после панели действий.
  static const double bottomPadding = 16.0;

  // ---------------------------------------------------------------------------
  // Toolbar
  // ---------------------------------------------------------------------------

  /// Размер аватара в свернутом состоянии.
  static const double toolbarAvatarSize = 42.0;

  /// Верхняя координата аватара в toolbar.
  static const double toolbarAvatarTop = 10.0;

  /// Верхняя координата заголовка в toolbar.
  static const double toolbarTitleTop = 18.0;

  // ---------------------------------------------------------------------------
  // Derived layout
  // ---------------------------------------------------------------------------

  /// Верхняя координата большого аватара.
  static const double avatarTop = topPadding;

  /// Верхняя координата заголовка.
  static const double titleTop = avatarTop + avatarSize + spacing;

  /// Верхняя координата подзаголовка.
  static const double subtitleTop = titleTop + titleHeight + 4.0;

  /// Верхняя координата ActionBar.
  static const double actionBarTop = subtitleTop + subtitleHeight + spacing;

  /// Полная высота раскрытого Header.
  static const double expandedHeight =
      actionBarTop + actionBarHeight + bottomPadding;

  // ---------------------------------------------------------------------------
  // Animation
  // ---------------------------------------------------------------------------

  /// С какого момента появляется toolbar title.
  static const double toolbarTitleFadeStart = 0.60;
  static const double toolbarTitleFadeEnd = 0.80;

  /// С какого момента исчезает большой аватар.
  static const double avatarFadeStart = 0.45;
  static const double avatarFadeEnd = 0.65;

  /// С какого момента исчезает подзаголовок.
  static const double subtitleFadeStart = 0.40;
  static const double subtitleFadeEnd = 0.55;

  /// С какого момента исчезает ActionBar.
  static const double actionBarFadeStart = 0.35;
  static const double actionBarFadeEnd = 0.55;

  /// С какого момента исчезает title.
  static const double titleFadeStart = .45;
  static const double titleFadeEnd = 0.65;

  /// Кривая движения аватара.
  static const Curve avatarCurve = Curves.easeOutCubic;

  /// Кривая появления toolbar title.
  static const Curve toolbarCurve = Curves.easeInOut;

  /// Кривая исчезновения ActionBar.
  static const Curve actionBarCurve = Curves.easeOut;

  /// Верхняя координата подзаголовка в свернутом состоянии.
  /// Используется только во время анимации.
  static const double toolbarSubtitleTop = toolbarTitleTop + 28.0;
}
