// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:coin_ex/api/repo/banner_repository.dart';
import 'package:coin_ex/api/repo/coin_list_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBaneerRepository baneerRepository;
  final ICoinListRepository coinListRepository;
  HomeBloc({
    required this.baneerRepository,
    required this.coinListRepository,
  }) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          emit(HomeLoading());
          final banners = await baneerRepository.getAll();
          final coinList = await coinListRepository.getAll();
          emit(HomeSuccess(
            banner: banners,
            coinList: coinList,
          ));
        } catch (e) {
          emit(HomeError());
        }
      }
    });
  }
}
