import 'package:bloc_practice/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final CounterState counterState1 = CounterState(counterValue: 1);
  final CounterState counterState2 = CounterState(counterValue: 1);

  //This should return true now
  print(counterState1 == counterState2);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}
