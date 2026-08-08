import 'package:chatting_app/core/network/base_remote_data_source.dart';
import 'package:chatting_app/features/notifications/data/models/unread_count_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../models/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> loadNotifications({
    NotificationType? type,
    int? limit,
    int? offset,
  });

  Future<NotificationModel?> markAsRead(String id);

  Future<bool> markAllAsRead();

  Future<int> getUnreadCount();
}

@LazySingleton(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImpl extends BaseRemoteDataSource
    implements NotificationsRemoteDataSource {
  NotificationsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<NotificationModel>> loadNotifications({
    NotificationType? type,
    int? limit,
    int? offset,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (type != null) {
      queryParameters.addAll({'type': type.name});
    }
    if (limit != null) {
      queryParameters.addAll({'limit': limit});
    }
    if (offset != null) {
      queryParameters.addAll({'offset': offset});
    }
    return makeRequest<List<NotificationModel>>(() async {
      final response = await dio.get(
        'notifications',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 && response.data != null) {
        return NotificationModel.fromList(response.data);
      }
      return [];
    });
  }

  @override
  Future<bool> markAllAsRead() async {
    return makeRequest<bool>(() async {
      final response = await dio.post('notifications/read-all');
      return response.statusCode == 204;
    });
  }

  @override
  Future<NotificationModel?> markAsRead(String id) async {
    return makeRequest<NotificationModel?>(() async {
      final response = await dio.post('notifications/$id/read');
      if (response.statusCode == 200 && response.data != null) {
        return NotificationModel.fromJson(response.data);
      }
      return null;
    });
  }

  @override
  Future<int> getUnreadCount() async {
    return makeRequest<int>(() async {
      final response = await dio.get('notifications/unread-count');
      if (response.statusCode == 200 && response.data != null) {
        return UnreadCountModel.fromJson(response.data).unreadCount;
      }
      return 0;
    });
  }
}
