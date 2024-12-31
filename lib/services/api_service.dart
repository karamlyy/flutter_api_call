import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../models/failure.dart';
import '../models/post.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Either<Failure, List<Post>>> fetchPosts() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      final posts = (response.data as List).map((json) => Post.fromJson(json)).toList();
      return Right(posts);
    } catch (e) {
      return Left(Failure('Failed to fetch posts: ${e.toString()}'));
    }
  }
}
