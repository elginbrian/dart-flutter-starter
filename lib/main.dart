import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/bloc/auth/auth_bloc.dart';
import 'package:flutter_starter/bloc/post/post_bloc.dart';
import 'package:flutter_starter/bloc/user/user_bloc.dart';
import 'package:flutter_starter/services/auth_service.dart';
import 'package:flutter_starter/services/post_service.dart';
import 'package:flutter_starter/services/user_service.dart';
import 'package:flutter_starter/views/app_router.dart';
import 'package:flutter_starter/widgets/web_layout.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthService()),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(PostService()),
        ),
        BlocProvider<UserBloc>(create: (context) => UserBloc(UserService())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Starter',
      theme: ThemeData.dark(),
      routerConfig: appRouter,
      builder: (context, child) {
        if (kIsWeb) {
          return WebLayout(
            localBackgroundImagePath: 'assets/default_background.jpg',
            child: child ?? const SizedBox(),
          );
        }
        return child ?? const SizedBox();
      },
    );
  }
}
