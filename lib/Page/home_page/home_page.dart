import 'package:extra/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:extra/headers.dart';

import '../../utils/snackBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();
List<Map> studentEdit = List.generate(
  Globals.globals.StudentData.length,
  (index) => {
    "name":
        TextEditingController(text: Globals.globals.StudentData[index]['name']),
    "grid":
        TextEditingController(text: Globals.globals.StudentData[index]['grid']),
    "std":
        TextEditingController(text: Globals.globals.StudentData[index]['std']),
  },
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void getState() {
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 13,
              child: listView(
                getState: getState,
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await Navigator.pushNamed(context, MyRoutes.addStudentPage);
                print(Globals.globals.StudentData[0]);
                setState(() {});
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
