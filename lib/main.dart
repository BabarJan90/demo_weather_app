import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'di/injector.dart';
import 'features/weather/cubit/weather_cubit.dart';
import 'features/weather/screen/weather_screen.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Weather',
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (_) => getIt<WeatherCubit>(),
      child: const WeatherScreen(),
    ),
  );
}
