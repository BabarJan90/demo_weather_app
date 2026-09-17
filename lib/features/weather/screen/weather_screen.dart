import 'package:demo_weather_app/features/weather/screen/weather_with_bloc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../bloc/weather_bloc.dart';
import '../cubit/file_upload_cubit.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'City name'),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<WeatherCubit>().load(_controller.text),
                  child: const Text('Get Weather'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => getIt<WeatherBloc>(),
                        child: const WeatherWithBlocScreen(),
                      ),
                    ),
                  ),
                  child: const Text('Get Weather With Bloc'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) => state.when(
                  initial: () => const Text('Enter a city to get started'),
                  loading: () => Center(
                    child: Center(child: const CircularProgressIndicator()),
                  ),
                  loaded: (weather) => Text(
                    '${weather.cityName}: ${weather.temperatureCelsius}°C, ${weather.description}',
                  ),
                  error: (message) => Text('Error: $message'),
                ),
              ),
            ),
            BlocConsumer<FileUploadCubit, FileUploadState>(
              listener: (context, state) {
                if (state is FileUploadSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('File uploaded (${state.message})')),
                  );
                }
              },
              builder: (context, state) {
                final isUploading = state is FileUploadInProgress;
                final progress = state is FileUploadInProgress
                    ? state.progress
                    : 0.0;

                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: isUploading
                          ? null
                          : () => context.read<FileUploadCubit>().uploadFile(),
                      child: const Text('Upload Large File'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: isUploading
                          ? null
                          : () => context
                                .read<FileUploadCubit>()
                                .uploadFileWithSpawn(),
                      child: const Text('Upload Large File With Spawn'),
                    ),
                    if (isUploading) ...[
                      const SizedBox(height: 8),
                      progress > 0
                          ? Column(
                              children: [
                                LinearProgressIndicator(value: progress),
                                Text('${(progress * 100).toStringAsFixed(0)}%'),
                              ],
                            )
                          : const LinearProgressIndicator(), // indeterminate — no progress info from compute()
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
