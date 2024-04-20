import 'package:extra/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/Globals.dart';

Widget form({required image, required save}) {
  return Form(
    key: formkey,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            GestureDetector(
              onTap: image,
              child: CircleAvatar(
                radius: 70,
                foregroundImage: Globals.globals.student_image == null
                    ? FileImage(File(
                        'https://i.pinimg.com/236x/0a/75/9f/0a759f8138be06b43a447b00c8a6e392.jpg'))
                    : FileImage(Globals.globals.student_image!),
                child: Globals.globals.student_image == null
                    ? IconButton(
                        onPressed: image,
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
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
