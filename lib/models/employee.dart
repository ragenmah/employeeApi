class Employee {
  final String employeeName; //source url
  final String employeeSalary;
  final String employeeAge;
  final String profileImage;

  Employee(
      {this.employeeName,
      this.employeeSalary,
      this.employeeAge,
      this.profileImage});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeName: json["employee_name"],
      employeeSalary: json["employee_salary"],
      employeeAge: json["employee_age"],
      profileImage: json["profile_image"],
    );
  }
}
