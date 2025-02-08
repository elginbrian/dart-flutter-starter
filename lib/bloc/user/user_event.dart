import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/request/user_request.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllUsers extends UserEvent {}

class FetchUserById extends UserEvent {
  final String userId;

  FetchUserById(this.userId);

  @override
  List<Object> get props => [userId];
}

class UpdateUserRequested extends UserEvent {
  final UpdateUserRequest request;

  UpdateUserRequested(this.request);

  @override
  List<Object> get props => [request];
}

class SearchUsersRequested extends UserEvent {
  final String query;

  SearchUsersRequested(this.query);

  @override
  List<Object> get props => [query];
}
