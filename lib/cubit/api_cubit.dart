import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../models/post.dart';
import '../models/failure.dart';
import '../repository/post_repository.dart';
import 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final PostRepository repository;

  ApiCubit(this.repository) : super(ApiInitial());

  Future<void> fetchPosts() async {
    emit(ApiLoading());
    final Either<Failure, List<Post>> result = await repository.getPosts();

    result.fold(
      (failure) => emit(ApiError(failure.message)),
      (posts) => emit(ApiSuccess(posts)),
    );
  }
}
