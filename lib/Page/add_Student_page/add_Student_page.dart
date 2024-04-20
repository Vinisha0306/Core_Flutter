import 'package:extra/headers.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/snackBar.dart';
import 'componets/form.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Student',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: form(
            image: () async {
              ImagePicker picker = ImagePicker();

              XFile? file = await picker.pickImage(source: ImageSource.gallery);

              if (file != null) {
                Globals.globals.student_image = File(file.path);
                setState(() {});
              }
            },
            save: () {
              bool validated = formkey.currentState!.validate();
              if (validated) {
                formkey.currentState!.save();
                Navigator.pop(context);
                Globals.globals.StudentData.add(
                  {
                    "name": Globals.globals.student_name,
                    "grid": Globals.globals.student_grid,
                    "std": Globals.globals.student_standard,
                    "image": Globals.globals.student_image
                  },
                );
              }
              ScaffoldMessenger.of(context).showSnackBar(
                MySnackBar(
                  color: validated ? Colors.green : Colors.red,
                  context: validated ? 'Form Saved' : 'Failed To Validate Form',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
