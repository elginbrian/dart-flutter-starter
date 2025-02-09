import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/services/user_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;
  final Map<String, dynamic> _userCache = {};

  UserBloc(this._userService) : super(UserInitial()) {
    on<FetchAllUsers>(_onFetchAllUsers);
    on<FetchUserById>(_onFetchUserById);
    on<UpdateUserRequested>(_onUpdateUser);
    on<SearchUsersRequested>(_onSearchUsers);
  }

  Future<void> _onFetchAllUsers(
      FetchAllUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await _userService.getAllUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UserError("Failed to fetch users: ${e.toString()}"));
    }
  }

  Future<void> _onFetchUserById(
      FetchUserById event, Emitter<UserState> emit) async {
    if (_userCache.containsKey(event.userId)) {
      emit(UserLoaded(_userCache[event.userId]));
      return;
    }

    emit(UserLoading());
    try {
      final user = await _userService.getUserById(event.userId);
      _userCache[event.userId] = user;
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Failed to fetch user: ${e.toString()}"));
    }
  }

  Future<void> _onUpdateUser(
      UpdateUserRequested event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final response = await _userService.updateUser(event.request);
      _userCache[response.data.id] = response.data;
      emit(UserUpdated(response));
    } catch (e) {
      emit(UserError("Failed to update user: ${e.toString()}"));
    }
  }

  Future<void> _onSearchUsers(
      SearchUsersRequested event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final results = await _userService.searchUsers(event.query);
      emit(UsersSearched(results));
    } catch (e) {
      emit(UserError("Failed to search users: ${e.toString()}"));
    }
  }
}
