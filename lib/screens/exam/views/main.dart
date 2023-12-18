import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'package:mobile_exam/screens/exam/counter_bloc.dart';

class ViewState extends base.ViewState {
  final Map<String, dynamic> data;
  ViewState({required this.data});

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return ListView(children: [
              const SizedBox(height: 20),
              Image.network(
                data['image'],
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 20),
              Text(data['message']),
              ElevatedButton(
                onPressed: () async {
                  context.read<CounterBloc>().increment();
                  await context.server.addToCount(1);
                },
                child: Text('${context.strings.counterButtonLabel} $count'),
              )
            ]);
          },
        ),
      ),
    );
  }
}
