import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_repos/bloc/searchrepositories_bloc.dart';
import 'package:search_repos/screens/results_screen.dart';
import 'package:search_repos/screens/search_screen.dart';

import 'consts/consts.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchrepositoriesBloc>(
      create: (context) => SearchrepositoriesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocConsumer<SearchrepositoriesBloc, SearchRepositoriesState>(
            listener: (context, state) {
              if (state is RepositoriesError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.blue,
                    content: Text(
                      'Ошибка: ${RepositoriesError().error}',
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is SearchRepositoriesInitial) {
                return SearchScreen();
              } else if (state is RepositoriesLoaded) {
                return ResultsScreen();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
