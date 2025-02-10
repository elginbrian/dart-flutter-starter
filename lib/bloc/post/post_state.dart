import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/response/post_response.dart';
import 'package:flutter_starter/models/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostsLoaded extends PostState {
  final GetAllPostsResponse response;

  const PostsLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class PostLoaded extends PostState {
  final GetPostByIDResponse post;

  const PostLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class UserPostsLoaded extends PostState {
  final List<Post> userPosts;

  const UserPostsLoaded(this.userPosts);

  @override
  List<Object> get props => [userPosts];
}

class PostCreated extends PostState {
  final CreatePostResponse response;

  const PostCreated(this.response);

  @override
  List<Object> get props => [response];
}

class PostUpdated extends PostState {
  final UpdatePostResponse response;

  const PostUpdated(this.response);

  @override
  List<Object> get props => [response];
}

class PostDeleted extends PostState {
  const PostDeleted();
}

class PostsSearched extends PostState {
  final List<Post> searchResults;

  const PostsSearched(this.searchResults);

  @override
  List<Object> get props => [searchResults];
}

class PostError extends PostState {
  final String message;

  const PostError(this.message);

  @override
  List<Object> get props => [message];
}
