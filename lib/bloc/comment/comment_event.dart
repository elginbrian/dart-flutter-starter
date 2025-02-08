import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/request/comment_request.dart';

abstract class CommentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCommentsByPost extends CommentEvent {
  final String postId;

  FetchCommentsByPost(this.postId);

  @override
  List<Object> get props => [postId];
}

class CreateCommentRequested extends CommentEvent {
  final String postId;
  final CreateCommentRequest request;

  CreateCommentRequested(this.postId, this.request);

  @override
  List<Object> get props => [postId, request];
}

class DeleteCommentRequested extends CommentEvent {
  final String commentId;

  DeleteCommentRequested(this.commentId);

  @override
  List<Object> get props => [commentId];
}
