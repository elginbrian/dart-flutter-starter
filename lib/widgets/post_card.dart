import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/bloc/like/like_bloc.dart';
import 'package:flutter_starter/bloc/like/like_event.dart';
import 'package:flutter_starter/bloc/like/like_state.dart';
import 'package:flutter_starter/bloc/comment/comment_bloc.dart';
import 'package:flutter_starter/bloc/comment/comment_event.dart';
import 'package:flutter_starter/bloc/comment/comment_state.dart';
import 'package:flutter_starter/models/post_model.dart';
import 'package:flutter_starter/models/user_model.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final User? user;

  const PostCard({super.key, required this.post, required this.user});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int likeCount = 0;
  int commentCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<LikeBloc>().add(FetchLikesByPost(widget.post.id));
    context.read<CommentBloc>().add(FetchCommentsByPost(widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.user?.name ?? "Unknown User";
    String email = widget.user?.email ?? "Unknown Email";
    String imageUrl = widget.user?.imageUrl ?? "";

    return MultiBlocListener(
      listeners: [
        BlocListener<LikeBloc, LikeState>(
          listener: (context, state) {
            if (state is LikesLoaded) {
              setState(() {
                likeCount = state.likes.length;
              });
            } else if (state is PostLiked) {
              setState(() {
                isLiked = true;
                likeCount++;
              });
            } else if (state is PostUnliked) {
              setState(() {
                isLiked = false;
                likeCount--;
              });
            }
          },
        ),
        BlocListener<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is CommentsLoaded) {
              setState(() {
                commentCount = state.comments.length;
              });
            }
          },
        ),
      ],
      child: _buildPostCard(context, username, email, imageUrl),
    );
  }

  Widget _buildPostCard(
      BuildContext context, String username, String email, String imageUrl) {
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
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:
                    imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                onBackgroundImageError: (_, __) =>
                    const Icon(Icons.error, color: Colors.white),
                child: imageUrl.isEmpty
                    ? const Icon(Icons.person, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      email,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.post.createdAt.hour}h ago",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.post.caption ?? 'No caption available',
            style: const TextStyle(color: Colors.white),
          ),
          if (widget.post.imageUrl?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.post.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[800],
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _postAction(Icons.comment, commentCount.toString()),
              _likeButton(context),
              _postAction(Icons.share, ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget _likeButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLiked) {
          context.read<LikeBloc>().add(UnlikePostRequested(widget.post.id));
        } else {
          context.read<LikeBloc>().add(LikePostRequested(widget.post.id));
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            size: 20,
            color: isLiked ? Colors.red : Colors.grey,
          ),
          const SizedBox(width: 4),
          Text(
            likeCount.toString(),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
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
