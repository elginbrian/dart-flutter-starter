import 'package:equatable/equatable.dart';
import 'package:flutter_starter/api/response/like_response.dart';

abstract class LikeState extends Equatable {
  @override
  List<Object> get props => [];
}

class LikeInitial extends LikeState {}

class LikeLoading extends LikeState {}

class PostLiked extends LikeState {
  final LikeResponse response;

  PostLiked(this.response);

  @override
  List<Object> get props => [response];
}

class PostUnliked extends LikeState {}

class LikesLoaded extends LikeState {
  final List<GetAllLikesResponse> likes;

  LikesLoaded(this.likes);

  @override
  List<Object> get props => [likes];
}

class UserLikesLoaded extends LikeState {
  final List<GetAllLikesResponse> userLikes;

  UserLikesLoaded(this.userLikes);

  @override
  List<Object> get props => [userLikes];
}

class LikeError extends LikeState {
  final String message;

  LikeError(this.message);

  @override
  List<Object> get props => [message];
}
