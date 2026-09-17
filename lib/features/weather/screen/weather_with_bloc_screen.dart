import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../cubit/weather_state.dart';

class WeatherWithBlocScreen extends StatefulWidget {
  const WeatherWithBlocScreen({super.key});

  @override
  State<WeatherWithBlocScreen> createState() => _WeatherWithBlocScreenState();
}

class _WeatherWithBlocScreenState extends State<WeatherWithBlocScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather (Bloc)')),
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
                  onPressed: () => context.read<WeatherBloc>().add(
                    WeatherEvent.loadRequested(_controller.text),
                  ),
                  child: const Text('Get Weather'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
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
