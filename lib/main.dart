import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp( MovieApp(appRouter: AppRouter(),));

  // PopularApi().getAllPopular();
}

// ignore: must_be_immutable
class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.appRouter});

 final  AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRouter.generateRoute,
    );
  }
}
