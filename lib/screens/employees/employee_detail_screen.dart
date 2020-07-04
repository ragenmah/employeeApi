import 'package:employeeapi/viewmodels/employee_view_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final EmployeeViewModel employee;

  EmployeeDetailScreen({@required this.employee});

  @override
  Widget build(BuildContext context) {
    String employeeName = int.parse(this.employee.employeeSalary) > 345000
        ? "${this.employee.employeeName} *"
        : this.employee.employeeName ?? 'No name';
    return Scaffold(
      appBar: AppBar(
        title: Text(employeeName),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          this.employee.profileImage != ""
              ? Image.network(
                  this.employee.profileImage,
                )
              : Image.asset(
                  "assets/employee/dummy_employee.jpg",
                ),
          Text(
            "Employee Name: ${employeeName.toString()}",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Text(
            "Employee Age: ${this.employee.employeeAge}",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.left,
          ),
          Text(
            "Employee Salary: ${this.employee.employeeSalary}",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.left,
          ),
        ]),
      ),
    );
  }
}
