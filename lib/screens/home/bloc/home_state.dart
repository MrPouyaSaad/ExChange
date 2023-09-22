part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {}

final class HomeSuccess extends HomeState {
  final List banner;
  final List coinList;

  HomeSuccess({
    required this.banner,
    required this.coinList,
  });
}
