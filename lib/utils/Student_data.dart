import 'package:extra/headers.dart';

List<Map> StudentData = [];

List allStudentData = StudentData.map(
  (e) => Student.formMap(data: e),
).toList();
