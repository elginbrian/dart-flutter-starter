import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/bloc/auth/auth_bloc.dart';
import 'package:flutter_starter/bloc/auth/auth_state.dart';
import 'package:flutter_starter/views/change_password.dart';
import 'package:flutter_starter/views/create_post_screen.dart';
import 'package:flutter_starter/views/home_screen.dart';
import 'package:flutter_starter/views/login_screen.dart';
import 'package:flutter_starter/views/profile_screen.dart';
import 'package:flutter_starter/views/register_screen.dart';
import 'package:flutter_starter/views/update_profile.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter(BuildContext context) {
  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;

      final bool isAuthenticated = authState is AuthAuthenticated;
      final bool isTryingToAccessRestrictedRoute =
          state.fullPath == '/profile' || state.fullPath == '/create-post';

      if (!isAuthenticated && isTryingToAccessRestrictedRoute) {
        return '/auth/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      // GoRoute(
      //     path: '/profile/:userId',
      //     builder: (context, state) {
      //       final userId = state.extra as String?;
      //       return ProfileScreen(userId: userId);
      //     }),
      GoRoute(
          path: '/update-profile',
          builder: (context, state) {
            return const UpdateProfileScreen();
          }),
      GoRoute(
          path: '/change-password',
          builder: (context, state) {
            return const ChangePasswordScreen();
          }),
      GoRoute(
        path: '/create-post',
        builder: (context, state) => const CreatePostScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
