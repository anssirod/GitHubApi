import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:search_repos/api/github_api.dart';
import 'package:search_repos/models/search_repositories_model.dart';

part 'searchrepositories_event.dart';
part 'searchrepositories_state.dart';

SearchRepositoriesModel repositories;
String keyword;

class SearchrepositoriesBloc
    extends Bloc<SearchRepositoriesEvent, SearchRepositoriesState> {
  SearchrepositoriesBloc() : super(SearchRepositoriesInitial());

  @override
  Stream<SearchRepositoriesState> mapEventToState(
    SearchRepositoriesEvent event,
  ) async* {
    if (event is SearchRepoEvent) {
      if (event.keyword != null && event.keyword.isNotEmpty) {
        try {
          yield RepositoriesLoading();
          keyword = event.keyword;
          repositories = SearchRepositoriesModel.fromJson(jsonDecode(
              await GitHubAPI().getListOfRepositories(event.keyword)));
          yield RepositoriesLoaded(repository: repositories);
        } catch (e) {
          yield RepositoriesError(error: e);
          yield SearchRepositoriesInitial();
        }
      } else {
        yield RepositoriesError();
        yield SearchRepositoriesInitial();
      }
    }
  }
}
