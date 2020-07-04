import 'package:dio/dio.dart';
import 'package:employeeapi/models/employee.dart';

class WebServices {
  var dio = new Dio();

  Future<List<Employee>> fetchAllEmployees() async {
    String url = "http://dummy.restapiexample.com/api/v1/employees";

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result["data"];
      print(list);
      return list.map((detail) => Employee.fromJson(detail)).toList();
    } else {
      throw Exception("Failed to get employee details");
    }
  }
}
