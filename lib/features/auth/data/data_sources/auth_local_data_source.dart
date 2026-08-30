import 'dart:convert';
import 'dart:developer';

import 'package:chatting_app/app/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_token_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(AuthTokenModel token);

  Future<AuthTokenModel?> getCachedToken();

  Future<void> clearToken();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  AuthTokenModel? _tokenModel;

  @override
  Future<void> cacheToken(AuthTokenModel token) async {
    _tokenModel = token;
    await sharedPreferences.setString(
      AppConstants.cachedTokenKey,
      jsonEncode(token.toJson()),
    );
  }

  @override
  Future<void> clearToken() async {
    _tokenModel = null;
    final result = await sharedPreferences.remove(AppConstants.cachedTokenKey);
    if (kDebugMode) {
      log('Cached token removed: $result');
      log('Cached _tokenModel removed: ${_tokenModel == null}');
    }
  }

  @override
  Future<AuthTokenModel?> getCachedToken() async {
    if (_tokenModel != null) {
      return _tokenModel;
    }

    final jsonString = sharedPreferences.getString(AppConstants.cachedTokenKey);

    if (jsonString == null) {
      return null;
    }

    _tokenModel = AuthTokenModel.fromJson(jsonDecode(jsonString));

    return _tokenModel;
  }
}
