import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/response/post_response.dart';

abstract class PostState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostsLoaded extends PostState {
  final GetAllPostsResponse response;
  PostsLoaded(this.response);
}

class PostLoaded extends PostState {
  final GetPostByIDResponse post;

  PostLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class UserPostsLoaded extends PostState {
  final List<GetAllPostsResponse> userPosts;

  UserPostsLoaded(this.userPosts);

  @override
  List<Object> get props => [userPosts];
}

class PostCreated extends PostState {
  final CreatePostResponse response;

  PostCreated(this.response);

  @override
  List<Object> get props => [response];
}

class PostUpdated extends PostState {
  final UpdatePostResponse response;

  PostUpdated(this.response);

  @override
  List<Object> get props => [response];
}

class PostDeleted extends PostState {}

class PostsSearched extends PostState {
  final List<SearchPostsResponse> searchResults;

  PostsSearched(this.searchResults);

  @override
  List<Object> get props => [searchResults];
}

class PostError extends PostState {
  final String message;

  PostError(this.message);

  @override
  List<Object> get props => [message];
}
