import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/api_cubit.dart';
import '../../cubit/api_state.dart';
import '../../models/post.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final apiCubit = context.read<ApiCubit>();

    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => apiCubit.fetchPosts(),
            child: Text('Get Data'),
          ),
          Expanded(
            child: BlocBuilder<ApiCubit, ApiState>(
              builder: (context, state) {
                if (state is ApiLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ApiSuccess) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final Post post = state.data[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  );
                } else if (state is ApiError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Press the button to get data.'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
