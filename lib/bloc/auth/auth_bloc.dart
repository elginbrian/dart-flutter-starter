import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/services/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<FetchCurrentUser>(_onFetchCurrentUser);
    on<ChangePasswordRequested>(_onChangePasswordRequested);
    on<RefreshTokenRequested>(_onRefreshTokenRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.login(event.request);
      final user = await _authService.getCurrentUser();
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError("Login failed: ${e.toString()}"));
    }
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.register(event.request);
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError("Registration failed: ${e.toString()}"));
    }
  }

  Future<void> _onFetchCurrentUser(
      FetchCurrentUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.getCurrentUser();
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onChangePasswordRequested(
      ChangePasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.changePassword(event.request);
      emit(AuthAuthenticated(await _authService.getCurrentUser()));
    } catch (e) {
      emit(AuthError("Change password failed: ${e.toString()}"));
    }
  }

  Future<void> _onRefreshTokenRequested(
      RefreshTokenRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.refreshAccessToken(event.request);
      final user = await _authService.getCurrentUser();
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError("Token refresh failed: ${e.toString()}"));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthUnauthenticated());
  }
}
