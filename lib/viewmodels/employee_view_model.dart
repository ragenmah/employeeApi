import 'package:employeeapi/models/employee.dart';

class EmployeeViewModel {
  Employee employee;
  EmployeeViewModel({Employee employee}) : employee = employee;

  String get employeeName {
    return employee.employeeName;
  }

  String get employeeSalary {
    return employee.employeeSalary;
  }

  String get employeeAge {
    return employee.employeeAge;
  }

  String get profileImage {
    return employee.profileImage;
  }
}
