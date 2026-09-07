import 'package:flutter/material.dart';

@immutable
abstract final class ChatHeaderMetrics {
  const ChatHeaderMetrics._();

  // ---------------------------------------------------------------------------
  // Layout
  // ---------------------------------------------------------------------------

  /// Top margin to the large avatar.
  static const double topPadding = 32.0;

  /// Big avatar size.
  static const double avatarSize = 88.0;

  /// Margin between the blocks.
  static const double spacing = 16.0;

  /// Chat title line height.
  static const double titleHeight = 32.0;

  /// Subtitle line height.
  static const double subtitleHeight = 20.0;

  /// Action bar height.
  static const double actionBarHeight = 72.0;

  /// Bottom margin after the action bar.
  static const double bottomPadding = 16.0;

  // ---------------------------------------------------------------------------
  // Toolbar
  // ---------------------------------------------------------------------------

  /// Avatar size when collapsed.
  static const double toolbarAvatarSize = 42.0;

  /// Top coordinate of the avatar in the toolbar.
  static const double toolbarAvatarTop = 10.0;

  /// Top coordinate of the header in the toolbar.
  static const double toolbarTitleTop = 18.0;

  // ---------------------------------------------------------------------------
  // Derived layout
  // ---------------------------------------------------------------------------

  /// Top coordinate of the large avatar.
  static const double avatarTop = topPadding;

  /// Top coordinate of the header.
  static const double titleTop = avatarTop + avatarSize + spacing;

  /// Top coordinate of subtitle.
  static const double subtitleTop = titleTop + titleHeight + 4.0;

  /// ActionBar top coordinate.
  static const double actionBarTop = subtitleTop + subtitleHeight + spacing;

  /// Full height of the expanded Header.
  static const double expandedHeight =
      actionBarTop + actionBarHeight + bottomPadding;

  // ---------------------------------------------------------------------------
  // Animation
  // ---------------------------------------------------------------------------

  /// At what point does the toolbar title appear.
  static const double toolbarTitleFadeStart = 0.60;
  static const double toolbarTitleFadeEnd = 0.80;

  /// At what point does the large avatar disappear.
  static const double avatarFadeStart = 0.45;
  static const double avatarFadeEnd = 0.65;

  /// At what point does the subtitle disappear.
  static const double subtitleFadeStart = 0.40;
  static const double subtitleFadeEnd = 0.55;

  /// At what point does the ActionBar disappear.
  static const double actionBarFadeStart = 0.35;
  static const double actionBarFadeEnd = 0.55;

  /// At what point does the title disappear.
  static const double titleFadeStart = .45;
  static const double titleFadeEnd = 0.65;

  /// Avatar movement curve.
  static const Curve avatarCurve = Curves.easeOutCubic;

  /// Toolbar title appearance curve.
  static const Curve toolbarCurve = Curves.easeInOut;

  /// ActionBar disappearance curve.
  static const Curve actionBarCurve = Curves.easeOut;

  /// Top coordinate of the subheading in the collapsed state.
  /// Used only during animation..
  static const double toolbarSubtitleTop = toolbarTitleTop + 28.0;
}
