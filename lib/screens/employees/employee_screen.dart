import 'package:employeeapi/screens/employees/employee_detail_screen.dart';
import 'package:employeeapi/viewmodels/employee_list_view_model.dart';
import 'package:employeeapi/viewmodels/employee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeListViewModel>(context, listen: false).allEmployees();
  }

  Widget _buildList(EmployeeListViewModel clvm) {
    switch (clvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _listOfEmployee(clvm.employees),
        );
      case LoadingStatus.empty:
        return Center(
          child: Text("No results found"),
        );
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel =
        Provider.of<EmployeeListViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text("Question no 9 solution"),
      ),
      body: _buildList(listViewModel),
    );
  }

  void _showEmployeeDetails(BuildContext context, EmployeeViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return EmployeeDetailScreen(
        employee: vm,
      );
    }));
  }

  Widget _listOfEmployee(List<EmployeeViewModel> employee) {
    return ListView.builder(
      itemCount: employee.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          _showEmployeeDetails(context, employee[index]);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Container(
            height: 30,
            child: Text(
              int.parse(employee[index].employeeSalary) == 345000
                  ? "${employee[index].employeeName} *"
                  : employee[index].employeeName,
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
