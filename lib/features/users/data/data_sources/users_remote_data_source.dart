import 'package:chatting_app/features/users/data/models/users_list_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';

abstract class UsersRemoteDataSource {
  Future<List<UserListItemModel>> loadUsers();
}

@LazySingleton(as: UsersRemoteDataSource)
class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  UsersRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<UserListItemModel>> loadUsers({
    String? query,
    String? limit,
    String? offset,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (query != null) {
        queryParameters.addAll({'query': query});
      }
      if (limit != null) {
        queryParameters.addAll({'limit': limit});
      }
      if (offset != null) {
        queryParameters.addAll({'offset': offset});
      }
      final response = await dio.get(
        'users',
        queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
      );
      if (response.statusCode == 200 && response.data != null) {
        return UserListItemModel.fromList(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return [];
  }
}
