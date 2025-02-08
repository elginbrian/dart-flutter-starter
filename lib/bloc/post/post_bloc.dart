import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/services/post_service.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService _postService;

  PostBloc(this._postService) : super(PostInitial()) {
    on<FetchAllPosts>(_onFetchAllPosts);
    on<FetchPostById>(_onFetchPostById);
    on<FetchPostsByUser>(_onFetchPostsByUser);
    on<CreatePostRequested>(_onCreatePost);
    on<UpdatePostRequested>(_onUpdatePost);
    on<DeletePostRequested>(_onDeletePost);
    on<SearchPostsRequested>(_onSearchPosts);
  }

  Future<void> _onFetchAllPosts(
      FetchAllPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await _postService.getAllPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostError("Failed to fetch posts: ${e.toString()}"));
    }
  }

  Future<void> _onFetchPostById(
      FetchPostById event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final post = await _postService.getPostById(event.postId);
      emit(PostLoaded(post));
    } catch (e) {
      emit(PostError("Failed to fetch post: ${e.toString()}"));
    }
  }

  Future<void> _onFetchPostsByUser(
      FetchPostsByUser event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final userPosts = await _postService.getPostsByUserId(event.userId);
      emit(UserPostsLoaded(userPosts));
    } catch (e) {
      emit(PostError("Failed to fetch user posts: ${e.toString()}"));
    }
  }

  Future<void> _onCreatePost(
      CreatePostRequested event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await _postService.createPost(event.request);
      emit(PostCreated(response));
    } catch (e) {
      emit(PostError("Failed to create post: ${e.toString()}"));
    }
  }

  Future<void> _onUpdatePost(
      UpdatePostRequested event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response =
          await _postService.updatePost(event.postId, event.request);
      emit(PostUpdated(response));
    } catch (e) {
      emit(PostError("Failed to update post: ${e.toString()}"));
    }
  }

  Future<void> _onDeletePost(
      DeletePostRequested event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      await _postService.deletePost(event.postId);
      emit(PostDeleted());
    } catch (e) {
      emit(PostError("Failed to delete post: ${e.toString()}"));
    }
  }

  Future<void> _onSearchPosts(
      SearchPostsRequested event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final results = await _postService.searchPosts(event.query);
      emit(PostsSearched(results));
    } catch (e) {
      emit(PostError("Failed to search posts: ${e.toString()}"));
    }
  }
}
