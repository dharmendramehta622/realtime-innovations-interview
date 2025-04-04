import 'package:flutter/material.dart';
import 'package:mainapp/mainapp.dart';
import 'package:todoapp/app.dart';


void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => EmployeeBloc()..add(LoadEmployee()),
      ), 
    ],
    child: MyApp(),
  ));
}
 