import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/services/comment_service.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentService _commentService;

  CommentBloc(this._commentService) : super(CommentInitial()) {
    on<FetchCommentsByPost>(_onFetchCommentsByPost);
    on<CreateCommentRequested>(_onCreateComment);
    on<DeleteCommentRequested>(_onDeleteComment);
  }

  Future<void> _onFetchCommentsByPost(
      FetchCommentsByPost event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final comments = await _commentService.getCommentsByPostID(event.postId);
      emit(CommentsLoaded(comments));
    } catch (e) {
      emit(CommentError("Failed to fetch comments: ${e.toString()}"));
    }
  }

  Future<void> _onCreateComment(
      CreateCommentRequested event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final response =
          await _commentService.createComment(event.postId, event.request);
      emit(CommentCreated(response));
    } catch (e) {
      emit(CommentError("Failed to create comment: ${e.toString()}"));
    }
  }

  Future<void> _onDeleteComment(
      DeleteCommentRequested event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      await _commentService.deleteComment(event.commentId);
      emit(CommentDeleted());
    } catch (e) {
      emit(CommentError("Failed to delete comment: ${e.toString()}"));
    }
  }
}
