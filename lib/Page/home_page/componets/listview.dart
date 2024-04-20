import 'package:extra/headers.dart';
import 'package:extra/routes.dart';
import 'package:extra/utils/Globals.dart';

Widget listView({required getState}) {
  return ListView.separated(
    itemCount: Globals.globals.StudentData.length,
    itemBuilder: (context, index) => Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.detailPage,
                arguments: Globals.globals.StudentData[index]);
          },
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: Colors.blue.shade800.withOpacity(0.8),
            leading: GestureDetector(
              onTap: () async {
                ImagePicker picker = ImagePicker();

                XFile? file =
                    await picker.pickImage(source: ImageSource.gallery);

                if (file != null) {
                  Globals.globals.student_image = File(file.path);
                  Globals.globals.StudentData[index]['image'] = File(file.path);
                  getState();
                }
              },
              child: CircleAvatar(
                radius: 30,
                foregroundImage: Globals.globals.student_image == null
                    ? FileImage(File(
                        'https://i.pinimg.com/236x/0a/75/9f/0a759f8138be06b43a447b00c8a6e392.jpg'))
                    : FileImage(Globals.globals.StudentData[index]['image']),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${Globals.globals.StudentData[index]['name']}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "GRID : ${Globals.globals.StudentData[index]['grid']}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Standard : ${Globals.globals.StudentData[index]['std']}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Student"),
                    actions: [
                      TextField(
                        controller: studentEdit[index]['name'],
                        onChanged: (value) {
                          Globals.globals.StudentData[index]['name'] = value;
                          getState();
                        },
                        decoration: const InputDecoration(
                          labelText: "Student  Name",
                        ),
                      ),
                      TextField(
                        controller: studentEdit[index]['grid'],
                        onChanged: (value) {
                          Globals.globals.StudentData[index]['grid'] = value;
                          getState();
                        },
                        decoration:
                            const InputDecoration(labelText: "Student  GRID"),
                      ),
                      TextField(
                        controller: studentEdit[index]['std'],
                        onChanged: (value) {
                          Globals.globals.StudentData[index]['std'] = value;
                          getState();
                        },
                        decoration: const InputDecoration(
                            labelText: "Student  Standard"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Done"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Globals.globals.StudentData
                .remove(Globals.globals.StudentData[index]);
            getState();
          },
          icon: Icon(Icons.delete),
        ),
        Divider(),
      ],
    ),
    separatorBuilder: (context, index) => const SizedBox(
      height: 10,
    ),
  );
}
