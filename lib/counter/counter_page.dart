import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({Key? key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Counter', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 5),
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (context.read<CounterCubit>().state < CounterCubit.maxCounter) {
                    context.read<CounterCubit>().increment();
                  } else {
                    _showToast('Límite superior alcanzado');
                  }
                },
                child: const Icon(Icons.add, size: 20),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const CounterText(),
            const SizedBox(height: 5),
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (context.read<CounterCubit>().state > CounterCubit.minCounter) {
                    context.read<CounterCubit>().decrement();
                  } else {
                    _showToast('Límite inferior alcanzado');
                  }
                },
                child: const Icon(Icons.remove, size: 20),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().reset(),
              child: const Text('Reset', style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) {
        return Text(
          '$count',
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}