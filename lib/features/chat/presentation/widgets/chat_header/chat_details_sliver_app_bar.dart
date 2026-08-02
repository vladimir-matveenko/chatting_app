import 'dart:ui';

import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/app_back_button.dart';
import '../../../../profile/presentation/widgets/user_avatar.dart';
import '../user_online_indicator.dart';
import 'chat_header_metrics.dart';

class ChatDetailsSliverAppBar extends StatelessWidget {
  const ChatDetailsSliverAppBar({
    super.key,
    required this.avatar,
    required this.title,
    required this.chatType,
    required this.isOnline,
    this.subtitle,
    this.actions = const [],
    this.actionBar,
  });

  final String avatar;
  final String title;
  final String? subtitle;
  final ChatType chatType;
  final bool isOnline;
  final List<Widget> actions;
  final Widget? actionBar;

  @override
  Widget build(BuildContext context) {
    final expandedHeight = ChatHeaderMetrics.expandedHeight;
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      expandedHeight: expandedHeight,
      leading: const AppBackButton(),
      actions: actions,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final toolbarHeight =
              kToolbarHeight + MediaQuery.paddingOf(context).top;

          final currentHeight = constraints.biggest.height;

          final progress =
              ((expandedHeight - currentHeight) /
                      (expandedHeight - toolbarHeight))
                  .clamp(0.0, 1.0);

          return _HeaderContent(
            progress: progress,
            avatar: avatar,
            title: title,
            subtitle: subtitle,
            chatType: chatType,
            isOnline: isOnline,
            actionBar: actionBar,
          );
        },
      ),
    );
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent({
    required this.progress,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.chatType,
    required this.isOnline,
    this.actionBar,
  });

  final double progress;

  final String avatar;
  final String title;
  final String? subtitle;

  final ChatType chatType;
  final bool isOnline;
  final Widget? actionBar;

  Widget _buildToolbarTitle(BuildContext context, double opacity) {
    return Positioned(
      left: kToolbarHeight,
      right: kToolbarHeight,
      top: MediaQuery.paddingOf(context).top,
      height: kToolbarHeight,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity,
          child: Center(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(double size, double top, double avatarOpacity) {
    return Positioned(
      left: 0,
      right: 0,
      top: top,
      child: Center(
        child: Opacity(
          opacity: avatarOpacity.clamp(0.0, 1.0),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                UserAvatar(avatar: avatar, firstName: title, size: size),

                if (chatType == ChatType.private && isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: UserOnlineIndicator(
                      baseUserAvatarSize: size,
                      indicatorSize: size * .18,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLargeTitle(
    BuildContext context,
    ThemeData theme,
    double top,
    double opacity,
  ) {
    return Positioned(
      left: 24,
      right: 24,
      top: top,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(
    BuildContext context,
    ThemeData theme,
    double top,
    double opacity,
  ) {
    return Positioned(
      left: 24,
      right: 24,
      top: top,
      child: IgnorePointer(
        child: Opacity(
          opacity: opacity,
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionBar(double top, double opacity, double offset) {
    if (actionBar == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: 16,
      right: 16,
      top: top,
      child: IgnorePointer(
        ignoring: opacity <= 0,
        child: Transform.translate(
          offset: Offset(0, offset),
          child: Opacity(opacity: opacity, child: actionBar!),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final avatarProgress = ChatHeaderMetrics.avatarCurve.transform(progress);

    final avatarTop = lerpDouble(
      ChatHeaderMetrics.avatarTop,
      ChatHeaderMetrics.toolbarAvatarTop,
      avatarProgress,
    )!;

    final avatarSize = lerpDouble(
      ChatHeaderMetrics.avatarSize,
      ChatHeaderMetrics.toolbarAvatarSize,
      avatarProgress,
    )!;

    final titleTop = lerpDouble(
      ChatHeaderMetrics.titleTop,
      ChatHeaderMetrics.toolbarTitleTop,
      avatarProgress,
    )!;

    final subtitleTop = lerpDouble(
      ChatHeaderMetrics.subtitleTop,
      ChatHeaderMetrics.toolbarSubtitleTop,
      progress,
    )!;

    final largeTitleOpacity =
        1 -
        ((progress - ChatHeaderMetrics.titleFadeStart) /
                (ChatHeaderMetrics.titleFadeEnd -
                    ChatHeaderMetrics.titleFadeStart))
            .clamp(0.0, 1.0);

    final subtitleOpacity = progress < ChatHeaderMetrics.subtitleFadeStart
        ? 1.0
        : 1.0 -
              ((progress - ChatHeaderMetrics.subtitleFadeStart) /
                      (1 - ChatHeaderMetrics.subtitleFadeStart))
                  .clamp(0.0, 1.0);

    final toolbarTitleOpacity =
        ((progress - ChatHeaderMetrics.toolbarTitleFadeStart) /
                (ChatHeaderMetrics.toolbarTitleFadeEnd -
                    ChatHeaderMetrics.toolbarTitleFadeStart))
            .clamp(0.0, 1.0);

    final avatarOpacity =
        1 -
        ((progress - ChatHeaderMetrics.avatarFadeStart) /
                (ChatHeaderMetrics.avatarFadeEnd -
                    ChatHeaderMetrics.avatarFadeStart))
            .clamp(0.0, 1.0);

    const actionBarTop = ChatHeaderMetrics.actionBarTop;

    final actionBarOffset =
        -40 * ChatHeaderMetrics.actionBarCurve.transform(progress);

    final actionBarOpacity = ChatHeaderMetrics.actionBarCurve.transform(
      1 -
          ((progress - ChatHeaderMetrics.actionBarFadeStart) /
                  (1 - ChatHeaderMetrics.actionBarFadeStart))
              .clamp(0.0, 1.0),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildToolbarTitle(context, toolbarTitleOpacity),

        _buildAvatar(avatarSize, avatarTop, avatarOpacity),

        _buildLargeTitle(context, theme, titleTop, largeTitleOpacity),

        if (subtitle != null)
          _buildSubtitle(context, theme, subtitleTop, subtitleOpacity),

        if (actionBar != null)
          _buildActionBar(actionBarTop, actionBarOpacity, actionBarOffset),
      ],
    );
  }
}
