import 'package:equatable/equatable.dart';

abstract class LikeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LikePostRequested extends LikeEvent {
  final String postId;

  LikePostRequested(this.postId);

  @override
  List<Object> get props => [postId];
}

class UnlikePostRequested extends LikeEvent {
  final String postId;

  UnlikePostRequested(this.postId);

  @override
  List<Object> get props => [postId];
}

class FetchLikesByPost extends LikeEvent {
  final String postId;

  FetchLikesByPost(this.postId);

  @override
  List<Object> get props => [postId];
}

class FetchLikesByUser extends LikeEvent {
  final String userId;

  FetchLikesByUser(this.userId);

  @override
  List<Object> get props => [userId];
}
