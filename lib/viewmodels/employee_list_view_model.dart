import 'package:employeeapi/models/employee.dart';
import 'package:employeeapi/services/webservices.dart';
import 'package:employeeapi/viewmodels/employee_view_model.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class EmployeeListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<EmployeeViewModel> employees = new List<EmployeeViewModel>();
  // MapType mapType = MapType.normal;

  void allEmployees() async {
    List<Employee> employeeList = await WebServices().fetchAllEmployees();
    notifyListeners();

    this.employees = employeeList
        .map((detail) => EmployeeViewModel(employee: detail))
        .toList();
    if (this.employees.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
