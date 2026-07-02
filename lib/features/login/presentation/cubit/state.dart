import 'package:equatable/equatable.dart';

enum LoginStatus { unknown, inProgress, success, failure }

class LoginState extends Equatable {
  const LoginState({this.status = LoginStatus.unknown, this.error});

  final LoginStatus status;
  final String? error;

  LoginState copyWith({LoginStatus? status, String? error}) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<dynamic> get props => [status, error];
}
