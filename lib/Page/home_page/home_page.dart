import 'package:extra/Page/details_page/componets/form.dart';
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
                Navigator.pushNamed(context, MyRoutes.detailPage).then(
                  (value) {
                    setState(() {});
                  },
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
