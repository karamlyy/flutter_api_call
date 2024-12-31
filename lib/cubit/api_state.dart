
import '../models/post.dart';

abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final List<Post> data;

  ApiSuccess(this.data);
}

class ApiError extends ApiState {
  final String message;

  ApiError(this.message);
}
