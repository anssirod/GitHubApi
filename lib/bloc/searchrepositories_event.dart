part of 'searchrepositories_bloc.dart';

@immutable
abstract class SearchRepositoriesEvent {}

class SearchRepoEvent extends SearchRepositoriesEvent {
  final keyword;
  SearchRepoEvent(this.keyword);
}
