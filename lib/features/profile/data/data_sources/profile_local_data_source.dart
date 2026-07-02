import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/constants/app_constants.dart';
import '../../../../core/error/exception.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel?> fetchProfile();

  Future<void> saveProfile(ProfileModel profile);

  Future<void> deleteProfile();
}

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  ProfileLocalDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<ProfileModel?> fetchProfile() async {
    try {
      final jsonString = sharedPreferences.getString(AppConstants.profileKey);
      if (jsonString != null) {
        return ProfileModel.fromJson(jsonDecode(jsonString));
      }
    } on Exception {
      throw CacheException();
    }
    return null;
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    try {
      final data = jsonEncode(profile.toJson());
      await sharedPreferences.setString(AppConstants.profileKey, data);
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteProfile() async {
    try {
      await sharedPreferences.remove(AppConstants.profileKey);
    } on Exception {
      throw CacheException();
    }
  }
}
