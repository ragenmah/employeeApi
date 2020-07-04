import 'package:employeeapi/screens/employees/employee_screen.dart';
import 'package:employeeapi/viewmodels/employee_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Question no. 9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => EmployeeListViewModel())
      ], child: EmployeeScreen()),
    );
  }
}
