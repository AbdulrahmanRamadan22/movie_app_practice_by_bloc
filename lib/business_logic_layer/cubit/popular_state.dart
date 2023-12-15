part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoaded extends PopularState {
  final List<PopularModel> populars;
  PopularLoaded({required this.populars});

}
