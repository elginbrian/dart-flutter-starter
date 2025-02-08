import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/request/post_request.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllPosts extends PostEvent {}

class FetchPostById extends PostEvent {
  final String postId;

  FetchPostById(this.postId);

  @override
  List<Object> get props => [postId];
}

class FetchPostsByUser extends PostEvent {
  final String userId;

  FetchPostsByUser(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreatePostRequested extends PostEvent {
  final CreatePostRequest request;

  CreatePostRequested(this.request);

  @override
  List<Object> get props => [request];
}

class UpdatePostRequested extends PostEvent {
  final String postId;
  final UpdatePostRequest request;

  UpdatePostRequested(this.postId, this.request);

  @override
  List<Object> get props => [postId, request];
}

class DeletePostRequested extends PostEvent {
  final String postId;

  DeletePostRequested(this.postId);

  @override
  List<Object> get props => [postId];
}

class SearchPostsRequested extends PostEvent {
  final String query;

  SearchPostsRequested(this.query);

  @override
  List<Object> get props => [query];
}
