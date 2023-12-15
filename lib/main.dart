import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactoring_excercise/cubit/balance_cubit.dart';
import 'package:refactoring_excercise/payment_dialog_model_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BalanceCubit(),
      child: MaterialApp(
        title: 'Flutter Excercise',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: ElevatedButton(
            child: const Text('Pay'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PaymentDialog(),
              );
            },
          ),
        );
      }),
    );
  }
}
