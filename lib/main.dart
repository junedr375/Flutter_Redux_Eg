import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxeg/Home.dart';
import 'package:reduxeg/model/model.dart';
import 'package:reduxeg/redux/reducer.dart';

enum ListAction { Add, Delete }

List<String> listReducer(List<String> state, dynamic action) {
  if (action == ListAction.Add) {
    return state;
  }
  if (action == ListAction.Delete) {
    state = [];
  }
  return state;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> myStore = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: myStore,
        child: MaterialApp(
            title: 'Flutter Reducx Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: NewHomePage()));
  }
}
