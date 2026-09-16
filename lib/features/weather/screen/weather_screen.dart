import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ElevatedButton(
              onPressed: () =>
                  context.read<WeatherCubit>().load(_controller.text),
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) => state.when(
                  initial: () => const Text('Enter a city to get started'),
                  loading: () =>
                      Center(child: const CircularProgressIndicator()),
                  loaded: (weather) => Text(
                    '${weather.cityName}: ${weather.temperatureCelsius}°C, ${weather.description}',
                  ),
                  error: (message) => Text('Error: $message'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
