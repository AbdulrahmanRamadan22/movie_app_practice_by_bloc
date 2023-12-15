import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic_layer/cubit/popular_cubit.dart';
import 'constants/stringes.dart';
import 'data_layer/api/popular_api.dart';
import 'data_layer/models/popular_model.dart';
import 'data_layer/repository/popular_repository.dart';
import 'presentation_layer/screens/popular_details_screen.dart';
import 'presentation_layer/screens/populars_screen.dart';

class AppRouter {
  late PopularRepository popularRepository;
  late PopularCubit popularCubit;

  AppRouter() {
    popularRepository = PopularRepository(popularApi: PopularApi());
    popularCubit = PopularCubit(popularRepository);
  }

  // popularsDetailsScreen

  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => popularCubit,
                  child: const PopularsScreen(),
                ));
      case popularsDetailsScreen:

              final popular = settings.arguments as PopularModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => popularCubit,
                  child:  PopularsDetailsScreen(popular: popular,),
                ));
    }
  }
}
