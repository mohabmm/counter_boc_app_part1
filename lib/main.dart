import 'package:counter_boc_app_part1/blocs/blocbase.dart';
import 'package:counter_boc_app_part1/blocs/counter_bloc.dart';
import 'package:counter_boc_app_part1/pages/counter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        child: new CounterPage(title: 'Flutter Demo Home Page'),
        bloc: CounterBloc(),
      ),
    );
  }
}
