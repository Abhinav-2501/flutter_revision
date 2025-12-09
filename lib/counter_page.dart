import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pure BLoC Counter')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(child: Text('${state.count}'));
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
            onPressed: () => context
                .read<CounterBloc>()
                .add(CounterIncrementPressed()),
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 8),

          FloatingActionButton(
            onPressed: () => context
                .read<CounterBloc>()
                .add(CounterDecrementPressed()),
            child: const Icon(Icons.remove),
          ),

        ],
      ),
    );
  }
}
