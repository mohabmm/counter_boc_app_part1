import 'package:counter_boc_app_part1/blocs/blocbase.dart';
import 'package:counter_boc_app_part1/blocs/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: counterBloc.outCounter,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot<int>) {
                  if (snapshot.data != null) {
                    return new Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          counterBloc.inpress.add(null);
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
