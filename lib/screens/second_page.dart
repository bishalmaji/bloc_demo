import 'package:flutter/material.dart';
import '../cubit/counter_cubit.dart';

class SecondPage extends StatelessWidget {
  final CounterCubit counterCubit;

  const SecondPage({super.key, required this.counterCubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Second Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 150.0,
              child: StreamBuilder<int>(
                stream: counterCubit.stream,
                initialData: counterCubit.state,
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 1;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: count,
                    itemBuilder: (context, index) {
                      return  Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 20),

                      );
                    },
                  );
                },
              ),
            ),
            StreamBuilder<int>(
              stream: counterCubit.stream,
              initialData: counterCubit.state,
              builder: (context, snapshot) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterCubit.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
