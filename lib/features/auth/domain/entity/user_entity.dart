import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.username,
    required this.displayName,
    required this.email,
    required this.avatarUrl,
    required this.createdAt,
  });

  final String id;
  final String username;
  final String displayName;
  final String email;
  final String avatarUrl;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
    id,
    username,
    displayName,
    email,
    avatarUrl,
    createdAt,
  ];
}
