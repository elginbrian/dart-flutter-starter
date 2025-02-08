import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/response/comment_response.dart';

abstract class CommentState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentsLoaded extends CommentState {
  final List<GetCommentsResponse> comments;

  CommentsLoaded(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentCreated extends CommentState {
  final CreateCommentResponse response;

  CommentCreated(this.response);

  @override
  List<Object> get props => [response];
}

class CommentDeleted extends CommentState {}

class CommentError extends CommentState {
  final String message;

  CommentError(this.message);

  @override
  List<Object> get props => [message];
}
