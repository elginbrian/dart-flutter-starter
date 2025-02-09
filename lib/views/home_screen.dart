import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/bloc/post/post_bloc.dart';
import 'package:flutter_starter/bloc/post/post_event.dart';
import 'package:flutter_starter/bloc/post/post_state.dart';
import 'package:flutter_starter/models/post_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(FetchAllPosts());

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
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () => context.go('/profile'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            final posts = state.response.data;

            if (posts.isEmpty) {
              return const Center(
                child: Text(
                  "No posts available",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _buildPost(post);
              },
            );
          } else if (state is PostError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(
            child: Text("No posts available",
                style: TextStyle(color: Colors.white)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/create-post'),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.create, color: Colors.white),
      ),
    );
  }

  Widget _buildPost(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User ${post.userId}",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@user${post.userId}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                "${post.createdAt.hour}h ago",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            post.caption ?? 'No caption available',
            style: const TextStyle(color: Colors.white),
          ),
          if (post.imageUrl?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    post.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _postAction(Icons.comment, "12"),
              _postAction(Icons.favorite_border, "24"),
              _postAction(Icons.share, ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget _postAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        if (label.isNotEmpty) ...[
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ],
    );
  }
}
