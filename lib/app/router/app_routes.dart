import 'package:flutter/material.dart';

@immutable
class AppRoutes {
  const AppRoutes._();

  static const splash = '/splash';
  static const waiting = '/waiting';
  static const login = '/login';
  static const camera = '/camera';
  static const createProfile = '/create-profile';
  static const resetPassword = '/reset-password';
  static const editProfile = 'edit-profile';
  static const licenses = '/licenses';
  static const chat = '/chat';
  static const chatSettings = '/settings';
  static const createGroup = '/create-group';

  /// Shell routes
  static const chats = '/chats';
  static const users = '/users';
  static const notifications = '/notifications';
  static const profile = '/profile';
}
