// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:movie_app_practice_by_bloc/data_layer/models/popular_model.dart';
import 'package:movie_app_practice_by_bloc/data_layer/repository/popular_repository.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {


  final PopularRepository popularRepository;

  PopularCubit(this.popularRepository) : super(PopularInitial());

    List<PopularModel> populars=[];

  List<PopularModel> getAllPopular() {
    popularRepository.getAllPopular().then((populars) {
      emit(PopularLoaded(populars: populars));

      this.populars = populars;
    });

    return populars;
  }
}
