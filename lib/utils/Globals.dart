import 'dart:io';

import 'package:extra/headers.dart';

class Globals {
  String? student_name;
  String? student_grid;
  String? student_standard;
  File? student_image;
  TextEditingController name = TextEditingController();

  List<Map> StudentData = [];

  static final Globals globals = Globals();
}
