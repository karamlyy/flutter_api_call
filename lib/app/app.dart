import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/api_cubit.dart';
import '../presenter/home/home_page.dart';
import '../repository/post_repository.dart';
import '../services/api_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio, Cubit, Dartz Example',
      home: RepositoryProvider(
        create: (_) => PostRepository(ApiService(Dio())),
        child: BlocProvider(
          create: (context) => ApiCubit(context.read<PostRepository>()),
          child: HomePage(),
        ),
      ),
    );
  }
}