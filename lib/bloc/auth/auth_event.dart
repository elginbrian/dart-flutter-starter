import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/request/auth_request.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final UserLoginRequest request;

  LoginRequested(this.request);

  @override
  List<Object> get props => [request];
}

class RegisterRequested extends AuthEvent {
  final UserRegistrationRequest request;

  RegisterRequested(this.request);

  @override
  List<Object> get props => [request];
}

class FetchCurrentUser extends AuthEvent {}

class ChangePasswordRequested extends AuthEvent {
  final ChangePasswordRequest request;

  ChangePasswordRequested(this.request);

  @override
  List<Object> get props => [request];
}

class RefreshTokenRequested extends AuthEvent {
  final RefreshTokenRequest request;

  RefreshTokenRequested(this.request);

  @override
  List<Object> get props => [request];
}

class LogoutRequested extends AuthEvent {}
