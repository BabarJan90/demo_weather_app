import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'di/injector.dart';
import 'features/weather/cubit/file_upload_cubit.dart';
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
    home: MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(create: (_) => getIt<WeatherCubit>()),
        BlocProvider<FileUploadCubit>(create: (_) => getIt<FileUploadCubit>()),
      ],
      child: const WeatherScreen(),
    ),
  );
}
