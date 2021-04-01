part of 'searchrepositories_bloc.dart';

@immutable
abstract class SearchRepositoriesState {}

class SearchRepositoriesInitial extends SearchRepositoriesState {}

class RepositoriesLoading extends SearchRepositoriesState {}

class RepositoriesLoaded extends SearchRepositoriesState {
  final SearchRepositoriesModel repository;
  RepositoriesLoaded({this.repository});
}

class RepositoriesError extends SearchRepositoriesState {
  final error;
  RepositoriesError({this.error});
}
