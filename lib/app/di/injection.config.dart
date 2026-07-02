// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatting_app/app/di/modules/network_module.dart' as _i930;
import 'package:chatting_app/app/di/modules/shared_pref_module.dart' as _i786;
import 'package:chatting_app/app/router/app_router.dart' as _i289;
import 'package:chatting_app/core/network/http_interceptors.dart' as _i370;
import 'package:chatting_app/core/services/auth_session_manager.dart' as _i186;
import 'package:chatting_app/features/auth/data/data_sources/auth_local_data_source.dart'
    as _i999;
import 'package:chatting_app/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i509;
import 'package:chatting_app/features/auth/data/repository/auth_repository_impl.dart'
    as _i626;
import 'package:chatting_app/features/auth/domain/repository/auth_repository.dart'
    as _i207;
import 'package:chatting_app/features/auth/domain/usecases/check_auth_usecase.dart'
    as _i323;
import 'package:chatting_app/features/auth/domain/usecases/get_user_profile_usecase.dart'
    as _i421;
import 'package:chatting_app/features/auth/domain/usecases/logout_usecase.dart'
    as _i844;
import 'package:chatting_app/features/auth/presentation/cubit/cubit.dart'
    as _i330;
import 'package:chatting_app/features/login/data/data_sources/login_remote_data_source.dart'
    as _i515;
import 'package:chatting_app/features/login/domain/usecases/login_usecase.dart'
    as _i171;
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart'
    as _i523;
import 'package:chatting_app/features/profile/data/data_sources/profile_local_data_source.dart'
    as _i989;
import 'package:chatting_app/features/profile/data/repository/profile_repository_impl.dart'
    as _i557;
import 'package:chatting_app/features/profile/domain/repository/profile_repository.dart'
    as _i672;
import 'package:chatting_app/features/profile/domain/usecases/delete_profile_usecase.dart'
    as _i619;
import 'package:chatting_app/features/profile/domain/usecases/fetch_profile_usecase.dart'
    as _i483;
import 'package:chatting_app/features/profile/domain/usecases/save_profile_usecase.dart'
    as _i421;
import 'package:chatting_app/features/profile/presentation/cubit/cubit.dart'
    as _i1058;
import 'package:chatting_app/features/theme/data/data_sources/theme_local_data_source.dart'
    as _i595;
import 'package:chatting_app/features/theme/data/repository/theme_repository_impl.dart'
    as _i352;
import 'package:chatting_app/features/theme/domain/repository/theme_repository.dart'
    as _i155;
import 'package:chatting_app/features/theme/domain/usecases/get_theme_usecase.dart'
    as _i678;
import 'package:chatting_app/features/theme/domain/usecases/set_theme_usecase.dart'
    as _i767;
import 'package:chatting_app/features/theme/presentation/cubit/cubit.dart'
    as _i58;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefModule = _$SharedPrefModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i370.ErrorInterceptor>(() => _i370.ErrorInterceptor());
    gh.lazySingleton<_i186.AuthSessionManager>(
      () => _i186.AuthSessionManager(),
    );
    gh.lazySingleton<_i999.AuthLocalDataSource>(
      () => _i999.AuthLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.refreshDio(),
      instanceName: 'refresh_dio',
    );
    gh.lazySingleton<_i989.ProfileLocalDataSource>(
      () => _i989.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i595.ThemeLocalDataSource>(
      () => _i595.ThemeLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i672.ProfileRepository>(
      () => _i557.ProfileRepositoryImpl(
        profileLocalDataSource: gh<_i989.ProfileLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i619.DeleteProfileUseCase>(
      () => _i619.DeleteProfileUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i483.FetchProfileUseCase>(
      () => _i483.FetchProfileUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i421.SaveProfileUseCase>(
      () => _i421.SaveProfileUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i155.ThemeRepository>(
      () => _i352.ThemeRepositoryImpl(
        themeLocalDataSource: gh<_i595.ThemeLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i678.GetThemeUseCase>(
      () => _i678.GetThemeUseCase(gh<_i155.ThemeRepository>()),
    );
    gh.lazySingleton<_i767.SetThemeUseCase>(
      () => _i767.SetThemeUseCase(gh<_i155.ThemeRepository>()),
    );
    gh.lazySingleton<_i370.AuthInterceptor>(
      () => _i370.AuthInterceptor(
        gh<_i999.AuthLocalDataSource>(),
        gh<_i186.AuthSessionManager>(),
        gh<_i361.Dio>(instanceName: 'refresh_dio'),
      ),
    );
    gh.lazySingleton<_i58.ThemeCubit>(
      () => _i58.ThemeCubit(
        gh<_i678.GetThemeUseCase>(),
        gh<_i767.SetThemeUseCase>(),
      ),
    );
    gh.lazySingleton<_i1058.ProfileCubit>(
      () => _i1058.ProfileCubit(
        gh<_i483.FetchProfileUseCase>(),
        gh<_i421.SaveProfileUseCase>(),
        gh<_i619.DeleteProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<_i370.AuthInterceptor>(),
        gh<_i370.ErrorInterceptor>(),
      ),
    );
    gh.lazySingleton<_i515.LoginRemoteDataSource>(
      () => _i515.LoginRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i509.AuthRemoteDataSource>(
      () => _i509.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i207.AuthRepository>(
      () => _i626.AuthRepositoryImpl(
        authLocalDataSource: gh<_i999.AuthLocalDataSource>(),
        authRemoteDataSource: gh<_i509.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i323.CheckAuthUseCase>(
      () => _i323.CheckAuthUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i421.GetUserProfileUseCase>(
      () => _i421.GetUserProfileUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i844.LogoutUseCase>(
      () => _i844.LogoutUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i171.LoginUseCase>(
      () => _i171.LoginUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i330.AuthCubit>(
      () => _i330.AuthCubit(
        gh<_i323.CheckAuthUseCase>(),
        gh<_i421.GetUserProfileUseCase>(),
        gh<_i844.LogoutUseCase>(),
      ),
    );
    gh.lazySingleton<_i523.LoginCubit>(
      () => _i523.LoginCubit(gh<_i171.LoginUseCase>()),
    );
    gh.lazySingleton<_i289.AppRouter>(
      () => _i289.AppRouter(gh<_i330.AuthCubit>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i786.SharedPrefModule {}

class _$NetworkModule extends _i930.NetworkModule {}
