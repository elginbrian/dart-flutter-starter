import 'package:flutter_starter/views/create_post_screen.dart';
import 'package:flutter_starter/views/home_screen.dart';
import 'package:flutter_starter/views/login_screen.dart';
import 'package:flutter_starter/views/profile_screen.dart';
import 'package:flutter_starter/views/register_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth/login',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        path: '/profile', builder: (context, state) => const ProfileScreen()),
    GoRoute(
        path: '/create-post',
        builder: (context, state) => const CreatePostScreen()),
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
