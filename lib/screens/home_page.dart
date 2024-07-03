import 'package:flutter/material.dart';
import '../cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final CounterCubit counterCubit;

  const MyHomePage({super.key, required this.title, required this.counterCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(title)),
      ),
      body:  Column(
          children: <Widget>[
            StreamBuilder<int>(
              stream: counterCubit.stream,
              initialData: counterCubit.state,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            Expanded(
              child: StreamBuilder<int>(
                stream: counterCubit.stream,
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 1;
                  return ListView.builder(
                    itemCount: count,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${index + 1}',style: const TextStyle(fontSize: 40),),
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Go to Second Page'),
            ),
            const SizedBox(height: 20,),
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: counterCubit.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
