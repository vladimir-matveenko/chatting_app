import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/app_theme_mode.dart';
import '../repository/theme_repository.dart';

@lazySingleton
class GetThemeUseCase implements UseCase<AppThemeMode?, NoParams> {
  GetThemeUseCase(this.repository);

  final ThemeRepository repository;

  @override
  Future<Either<Failure, AppThemeMode?>> call(NoParams params) async {
    return repository.getTheme();
  }
}
