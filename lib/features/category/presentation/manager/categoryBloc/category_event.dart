part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCategoryListEvent extends CategoryEvent {}
