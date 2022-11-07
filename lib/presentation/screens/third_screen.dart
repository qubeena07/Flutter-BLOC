import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, this.title, this.color}) : super(key: key);

  final String? title;
  final Color? color;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented"),
              duration: Duration(milliseconds: 300),
            ));
          } else if (state.wasIncremented == false) {
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented"),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    // '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
