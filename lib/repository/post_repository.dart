import 'package:dartz/dartz.dart';
import '../models/failure.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostRepository {
  final ApiService apiService;

  PostRepository(this.apiService);

  Future<Either<Failure, List<Post>>> getPosts() async {
    return await apiService.fetchPosts();
  }
}
