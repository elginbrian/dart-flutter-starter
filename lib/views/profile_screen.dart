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
import 'package:flutter_starter/models/user_model.dart';
import 'package:flutter_starter/widgets/post_card.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      final userId = authState.user.data.id;
      context.read<PostBloc>().add(FetchPostsByUser(userId));
      context.read<UserBloc>().add(FetchUserById(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          if (authState is AuthAuthenticated) {
            final User user = authState.user.data;

            return Column(
              children: [
                _buildProfileHeader(user, context),
                Expanded(child: _buildUserPosts(user)),
              ],
            );
          } else if (authState is AuthUnauthenticated) {
            return _buildAuthPrompt();
          } else {
            return _buildLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget _buildProfileHeader(
    User user,
    BuildContext context,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey,
          backgroundImage: (user.imageUrl?.isNotEmpty ?? false)
              ? NetworkImage(user.imageUrl!)
              : null,
          child: (user.imageUrl?.isEmpty ?? true)
              ? const Icon(Icons.person, color: Colors.white, size: 50)
              : null,
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          user.email,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.go('/update-profile');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Edit Profile"),
        ),
      ],
    );
  }

  Widget _buildUserPosts(User user) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, postState) {
        if (postState is PostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (postState is UserPostsLoaded) {
          final posts = postState.userPosts;

          if (posts.isEmpty) {
            return const Center(
              child:
                  Text("No posts yet.", style: TextStyle(color: Colors.white)),
            );
          }

          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              if (userState is UserLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (userState is UserLoaded) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostCard(post: post, user: user);
                  },
                );
              } else {
                return const Center(
                  child: Text("Failed to load user data",
                      style: TextStyle(color: Colors.red)),
                );
              }
            },
          );
        } else {
          return const Center(
            child: Text("Failed to load posts.",
                style: TextStyle(color: Colors.red)),
          );
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildAuthPrompt() {
    return const Center(
      child: Text("Please log in", style: TextStyle(color: Colors.grey)),
    );
  }
}
