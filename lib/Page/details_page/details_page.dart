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
      body: Padding(
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
    );
  }
}
