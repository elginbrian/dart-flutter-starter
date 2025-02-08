import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/services/like_service.dart';
import 'like_event.dart';
import 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  final LikeService _likeService;

  LikeBloc(this._likeService) : super(LikeInitial()) {
    on<LikePostRequested>(_onLikePost);
    on<UnlikePostRequested>(_onUnlikePost);
    on<FetchLikesByPost>(_onFetchLikesByPost);
    on<FetchLikesByUser>(_onFetchLikesByUser);
  }

  Future<void> _onLikePost(
      LikePostRequested event, Emitter<LikeState> emit) async {
    emit(LikeLoading());
    try {
      final response = await _likeService.likePost(event.postId);
      emit(PostLiked(response));
    } catch (e) {
      emit(LikeError("Failed to like post: ${e.toString()}"));
    }
  }

  Future<void> _onUnlikePost(
      UnlikePostRequested event, Emitter<LikeState> emit) async {
    emit(LikeLoading());
    try {
      await _likeService.unlikePost(event.postId);
      emit(PostUnliked());
    } catch (e) {
      emit(LikeError("Failed to unlike post: ${e.toString()}"));
    }
  }

  Future<void> _onFetchLikesByPost(
      FetchLikesByPost event, Emitter<LikeState> emit) async {
    emit(LikeLoading());
    try {
      final likes = await _likeService.getLikesByPostID(event.postId);
      emit(LikesLoaded(likes));
    } catch (e) {
      emit(LikeError("Failed to fetch likes: ${e.toString()}"));
    }
  }

  Future<void> _onFetchLikesByUser(
      FetchLikesByUser event, Emitter<LikeState> emit) async {
    emit(LikeLoading());
    try {
      final userLikes = await _likeService.getLikesByUserID(event.userId);
      emit(UserLikesLoaded(userLikes));
    } catch (e) {
      emit(LikeError("Failed to fetch user likes: ${e.toString()}"));
    }
  }
}
