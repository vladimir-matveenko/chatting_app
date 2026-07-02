import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/app_theme_mode.dart';
import '../../domain/repository/theme_repository.dart';
import '../data_sources/theme_local_data_source.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({required this.themeLocalDataSource});

  final ThemeLocalDataSource themeLocalDataSource;

  @override
  Either<Failure, AppThemeMode?> getTheme() {
    try {
      var mode = AppThemeMode.dark;
      final value = themeLocalDataSource.getTheme();
      switch (value) {
        case 'light':
          mode = AppThemeMode.light;
          break;
        case 'dark':
          mode = AppThemeMode.dark;
          break;
        default:
          mode = AppThemeMode.dark;
          break;
      }
      return Right(mode);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setTheme({required AppThemeMode mode}) async {
    try {
      await themeLocalDataSource.setTheme(mode.name);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
