import 'package:chatting_app/core/network/base_remote_data_source.dart';
import 'package:chatting_app/features/users/data/models/users_list_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class UsersRemoteDataSource {
  Future<List<UserListItemModel>> loadUsers();
}

@LazySingleton(as: UsersRemoteDataSource)
class UsersRemoteDataSourceImpl extends BaseRemoteDataSource
    implements UsersRemoteDataSource {
  UsersRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<UserListItemModel>> loadUsers({
    String? query,
    String? limit,
    String? offset,
  }) async {
    return makeRequest<List<UserListItemModel>>(() async {
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
      return [];
    });
  }
}
