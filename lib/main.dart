import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/core/api_service.dart';
import 'package:pricelocq/features/login/bloc/login_cubit.dart';
import 'package:pricelocq/features/login/login_repository.dart';
import 'package:pricelocq/features/login/login_screen.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_cubit.dart';
import 'package:pricelocq/features/search_station/search_station_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginRepository: LoginRepository(apiService: ApiService())),
        ),
        BlocProvider<SearchStationCubit>(
          create: (context) => SearchStationCubit(searchStationRepository: SearchStationRepository(apiService: ApiService())))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
