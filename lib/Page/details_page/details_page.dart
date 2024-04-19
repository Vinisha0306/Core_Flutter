import 'package:extra/headers.dart';

import '../../utils/snackBar.dart';
import 'componets/form.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Page'),
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
                StudentData.add(
                  {
                    "name": Globals.globals.student_name,
                    "grid": Globals.globals.student_grid,
                    "std": Globals.globals.student_standard,
                    "image": Globals.globals.student_image
                  },
                );
                print("=====================================================");
                print(StudentData[0]['name']);
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
