import 'package:extra/headers.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/Globals.dart';

Widget form({required image, required save}) {
  return Form(
    key: formkey,
    child: Column(
      children: [
        TextFormField(
          onSaved: (val) {
            Globals.globals.student_name = val;
          },
          validator: (val) {
            if (val!.isEmpty) {
              return 'Must Enter Name';
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Student Name',
            labelText: 'Name',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        TextFormField(
          onSaved: (val) {
            Globals.globals.student_grid = val;
          },
          validator: (val) {
            if (val!.isEmpty) {
              return 'Must Enter GRID';
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Student GRID',
            labelText: 'GRID',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        TextFormField(
          onSaved: (val) {
            Globals.globals.student_standard = val;
          },
          validator: (val) {
            if (val!.isEmpty) {
              return 'Must Enter Standard';
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Student Standard',
            labelText: 'Standard',
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: image,
          child: CircleAvatar(
            radius: 70,
            foregroundImage: Globals.globals.student_image == null
                ? null
                : FileImage(Globals.globals.student_image!),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: save,
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                formkey.currentState!.reset();
              },
              child: Text('Reset'),
            ),
          ],
        )
      ],
    ),
  );
}
