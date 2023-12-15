// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app_practice_by_bloc/data_layer/api/popular_api.dart';
import 'package:movie_app_practice_by_bloc/data_layer/models/popular_model.dart';

class PopularRepository {
  final PopularApi popularApi;
  const PopularRepository({
    required this.popularApi,
  });

  Future<List<PopularModel>> getAllPopular() async {
    final populars = await popularApi.getAllPopular();

    return populars.map((e) => PopularModel.fromJson(e)).toList();
  }
}
