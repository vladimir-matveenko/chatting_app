import 'package:injectable/injectable.dart';

import '../../features/auth/domain/usecases/get_token_usecase.dart';
import '../usecases/usecase.dart';

@injectable
class SocketTokenProvider {
  SocketTokenProvider(this._getTokenUseCase);

  final GetTokenUseCase _getTokenUseCase;

  Future<String?> call() async {
    final result = await _getTokenUseCase(NoParams());

    return result.fold((_) => null, (token) => token?.accessToken);
  }
}
