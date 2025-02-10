import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/bloc/auth/auth_bloc.dart';
import 'package:flutter_starter/bloc/auth/auth_state.dart';
import 'package:flutter_starter/bloc/post/post_bloc.dart';
import 'package:flutter_starter/bloc/post/post_event.dart';
import 'package:flutter_starter/bloc/post/post_state.dart';
import 'package:flutter_starter/bloc/user/user_bloc.dart';
import 'package:flutter_starter/bloc/user/user_event.dart';
import 'package:flutter_starter/bloc/user/user_state.dart';
import 'package:flutter_starter/widgets/post_card.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(FetchAllPosts());
    context.read<UserBloc>().add(FetchAllUsers());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flutter Starter", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              if (authState is AuthAuthenticated) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person, color: Colors.white),
                      onPressed: () => context.go('/profile'),
                    ),
                    const SizedBox(width: 8),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    onPressed: () => context.go('/auth/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, postState) {
          if (postState is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (postState is PostsLoaded) {
            final posts = postState.response.data;

            if (posts.isEmpty) {
              return const Center(
                child: Text("No posts available",
                    style: TextStyle(color: Colors.white)),
              );
            }

            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (userState is UsersLoaded) {
                  final users = {
                    for (var user in userState.users.data) user.id: user
                  };

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      final user = users[post.userId];

                      return PostCard(post: post, user: user);
                    },
                  );
                } else if (userState is UserError) {
                  return Center(
                    child: Text(userState.message,
                        style: const TextStyle(color: Colors.red)),
                  );
                }

                return const Center(
                  child: Text("No users available",
                      style: TextStyle(color: Colors.white)),
                );
              },
            );
          } else if (postState is PostError) {
            return Center(
              child: Text(postState.message,
                  style: const TextStyle(color: Colors.red)),
            );
          }

          return const Center(
            child: Text("No posts available",
                style: TextStyle(color: Colors.white)),
          );
        },
      ),
      floatingActionButton: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState is AuthAuthenticated) {
            return FloatingActionButton(
              onPressed: () => context.go('/create-post'),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.create, color: Colors.white),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
