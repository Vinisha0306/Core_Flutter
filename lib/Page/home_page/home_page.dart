import 'package:extra/Page/home_page/componets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:extra/headers.dart';

import '../../utils/snackBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 13,
              child: listView(),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text(
                        'Student Details',
                      ),
                      actions: [
                        //name
                        form(
                          image: () async {
                            ImagePicker picker = ImagePicker();

                            XFile? file = await picker.pickImage(
                                source: ImageSource.gallery);

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
                                context: validated
                                    ? 'Form Saved'
                                    : 'Failed To Validate Form',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              label: const Text('Add Student'),
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
      ),
    );
  }
}
