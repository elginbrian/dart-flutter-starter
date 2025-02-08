import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/response/user_response.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<GetAllUsersResponse> users;

  UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserLoaded extends UserState {
  final GetUserByIDResponse user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserUpdated extends UserState {
  final UpdateUserResponse response;

  UserUpdated(this.response);

  @override
  List<Object> get props => [response];
}

class UsersSearched extends UserState {
  final List<SearchUsersResponse> searchResults;

  UsersSearched(this.searchResults);

  @override
  List<Object> get props => [searchResults];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}
