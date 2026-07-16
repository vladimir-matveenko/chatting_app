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
import 'package:chatting_app/features/auth/domain/usecases/logout_usecase.dart'
    as _i844;
import 'package:chatting_app/features/auth/presentation/cubit/cubit.dart'
    as _i330;
import 'package:chatting_app/features/chat/data/data_sources/chat_remote_data_source.dart'
    as _i915;
import 'package:chatting_app/features/chat/data/repository/chat_repository_impl.dart'
    as _i325;
import 'package:chatting_app/features/chat/domain/repository/chat_repository.dart'
    as _i91;
import 'package:chatting_app/features/chat/domain/usecases/create_chat_usecase.dart'
    as _i919;
import 'package:chatting_app/features/chat/domain/usecases/get_chat_members_usecase.dart'
    as _i223;
import 'package:chatting_app/features/chat/domain/usecases/get_chat_usecase.dart'
    as _i415;
import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart'
    as _i348;
import 'package:chatting_app/features/chats/data/data_sources/chats_remote_data_source.dart'
    as _i423;
import 'package:chatting_app/features/chats/data/repository/chats_repository_impl.dart'
    as _i252;
import 'package:chatting_app/features/chats/domain/repository/chats_repository.dart'
    as _i989;
import 'package:chatting_app/features/chats/domain/usecases/load_chats_usecase.dart'
    as _i321;
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart'
    as _i55;
import 'package:chatting_app/features/login/domain/usecases/login_usecase.dart'
    as _i171;
import 'package:chatting_app/features/login/presentation/cubit/cubit.dart'
    as _i523;
import 'package:chatting_app/features/messages/data/data_sources/messages_remote_data_source.dart'
    as _i395;
import 'package:chatting_app/features/messages/data/repository/messages_repository_impl.dart'
    as _i2;
import 'package:chatting_app/features/messages/domain/repository/messages_repository.dart'
    as _i166;
import 'package:chatting_app/features/messages/domain/usecases/add_reaction_usecase.dart'
    as _i969;
import 'package:chatting_app/features/messages/domain/usecases/delete_message_usecase.dart'
    as _i663;
import 'package:chatting_app/features/messages/domain/usecases/delete_reaction_usecase.dart'
    as _i0;
import 'package:chatting_app/features/messages/domain/usecases/get_message_usecase.dart'
    as _i507;
import 'package:chatting_app/features/messages/domain/usecases/load_messages_usecase.dart'
    as _i882;
import 'package:chatting_app/features/messages/domain/usecases/send_message_usecase.dart'
    as _i977;
import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart'
    as _i714;
import 'package:chatting_app/features/profile/data/data_sources/profile_local_data_source.dart'
    as _i989;
import 'package:chatting_app/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i125;
import 'package:chatting_app/features/profile/data/repository/profile_repository_impl.dart'
    as _i557;
import 'package:chatting_app/features/profile/domain/repository/profile_repository.dart'
    as _i672;
import 'package:chatting_app/features/profile/domain/usecases/change_password_usecase.dart'
    as _i312;
import 'package:chatting_app/features/profile/domain/usecases/create_profile_usecase.dart'
    as _i605;
import 'package:chatting_app/features/profile/domain/usecases/fetch_profile_usecase.dart'
    as _i483;
import 'package:chatting_app/features/profile/domain/usecases/update_profile_usecase.dart'
    as _i237;
import 'package:chatting_app/features/profile/presentation/change_password_cubit/cubit.dart'
    as _i126;
import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart'
    as _i643;
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
import 'package:chatting_app/features/users/data/data_sources/users_remote_data_source.dart'
    as _i993;
import 'package:chatting_app/features/users/data/repository/users_repository_impl.dart'
    as _i16;
import 'package:chatting_app/features/users/domain/repository/users_repository.dart'
    as _i1068;
import 'package:chatting_app/features/users/domain/usecases/load_users_usecase.dart'
    as _i603;
import 'package:chatting_app/features/users/presentation/users_cubit/cubit.dart'
    as _i334;
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
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<_i370.AuthInterceptor>(),
        gh<_i370.ErrorInterceptor>(),
      ),
    );
    gh.lazySingleton<_i125.ProfileRemoteDataSource>(
      () => _i125.ProfileRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i423.ChatsRemoteDataSource>(
      () => _i423.ChatsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i395.MessagesRemoteDataSource>(
      () => _i395.MessagesRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i166.MessagesRepository>(
      () => _i2.MessagesRepositoryImpl(gh<_i395.MessagesRemoteDataSource>()),
    );
    gh.lazySingleton<_i672.ProfileRepository>(
      () => _i557.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i125.ProfileRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i969.AddReactionUseCase>(
      () => _i969.AddReactionUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i663.DeleteMessageUseCase>(
      () => _i663.DeleteMessageUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i0.DeleteReactionUseCase>(
      () => _i0.DeleteReactionUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i507.GetMessageUseCase>(
      () => _i507.GetMessageUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i882.LoadMessagesUseCase>(
      () => _i882.LoadMessagesUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i977.SendMessageUseCase>(
      () => _i977.SendMessageUseCase(gh<_i166.MessagesRepository>()),
    );
    gh.lazySingleton<_i509.AuthRemoteDataSource>(
      () => _i509.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i993.UsersRemoteDataSource>(
      () => _i993.UsersRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i714.MessagesCubit>(
      () => _i714.MessagesCubit(
        gh<_i882.LoadMessagesUseCase>(),
        gh<_i977.SendMessageUseCase>(),
        gh<_i663.DeleteMessageUseCase>(),
        gh<_i969.AddReactionUseCase>(),
        gh<_i0.DeleteReactionUseCase>(),
      ),
    );
    gh.lazySingleton<_i989.ChatsRepository>(
      () => _i252.ChatsRepositoryImpl(gh<_i423.ChatsRemoteDataSource>()),
    );
    gh.lazySingleton<_i915.ChatRemoteDataSource>(
      () => _i915.ChatRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i321.LoadChatsUseCase>(
      () => _i321.LoadChatsUseCase(gh<_i989.ChatsRepository>()),
    );
    gh.lazySingleton<_i312.ChangePasswordUseCase>(
      () => _i312.ChangePasswordUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i483.FetchProfileUseCase>(
      () => _i483.FetchProfileUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i237.UpdateProfileUseCase>(
      () => _i237.UpdateProfileUseCase(gh<_i672.ProfileRepository>()),
    );
    gh.lazySingleton<_i55.ChatsCubit>(
      () => _i55.ChatsCubit(gh<_i321.LoadChatsUseCase>()),
    );
    gh.lazySingleton<_i207.AuthRepository>(
      () => _i626.AuthRepositoryImpl(
        authLocalDataSource: gh<_i999.AuthLocalDataSource>(),
        authRemoteDataSource: gh<_i509.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1068.UsersRepository>(
      () => _i16.UsersRepositoryImpl(gh<_i993.UsersRemoteDataSource>()),
    );
    gh.lazySingleton<_i323.CheckAuthUseCase>(
      () => _i323.CheckAuthUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i844.LogoutUseCase>(
      () => _i844.LogoutUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i171.LoginUseCase>(
      () => _i171.LoginUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i605.CreateProfileUseCase>(
      () => _i605.CreateProfileUseCase(gh<_i207.AuthRepository>()),
    );
    gh.lazySingleton<_i603.LoadUsersUseCase>(
      () => _i603.LoadUsersUseCase(gh<_i1068.UsersRepository>()),
    );
    gh.lazySingleton<_i334.UsersCubit>(
      () => _i334.UsersCubit(gh<_i603.LoadUsersUseCase>()),
    );
    gh.lazySingleton<_i330.AuthCubit>(
      () => _i330.AuthCubit(
        gh<_i323.CheckAuthUseCase>(),
        gh<_i844.LogoutUseCase>(),
      ),
    );
    gh.lazySingleton<_i643.ProfileCubit>(
      () => _i643.ProfileCubit(
        gh<_i483.FetchProfileUseCase>(),
        gh<_i605.CreateProfileUseCase>(),
        gh<_i237.UpdateProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i126.ChangePasswordCubit>(
      () => _i126.ChangePasswordCubit(gh<_i312.ChangePasswordUseCase>()),
    );
    gh.lazySingleton<_i523.LoginCubit>(
      () => _i523.LoginCubit(gh<_i171.LoginUseCase>()),
    );
    gh.lazySingleton<_i91.ChatRepository>(
      () => _i325.ChatRepositoryImpl(gh<_i915.ChatRemoteDataSource>()),
    );
    gh.lazySingleton<_i289.AppRouter>(
      () => _i289.AppRouter(gh<_i330.AuthCubit>()),
    );
    gh.lazySingleton<_i919.CreateChatUseCase>(
      () => _i919.CreateChatUseCase(gh<_i91.ChatRepository>()),
    );
    gh.lazySingleton<_i223.GetChatMembersUseCase>(
      () => _i223.GetChatMembersUseCase(gh<_i91.ChatRepository>()),
    );
    gh.lazySingleton<_i415.GetChatUseCase>(
      () => _i415.GetChatUseCase(gh<_i91.ChatRepository>()),
    );
    gh.lazySingleton<_i348.ChatCubit>(
      () => _i348.ChatCubit(
        gh<_i415.GetChatUseCase>(),
        gh<_i223.GetChatMembersUseCase>(),
        gh<_i919.CreateChatUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i786.SharedPrefModule {}

class _$NetworkModule extends _i930.NetworkModule {}
