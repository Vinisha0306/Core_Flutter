import 'package:extra/headers.dart';
import 'package:extra/utils/Globals.dart';

Widget listView({required getState, required image}) {
  return ListView.separated(
    itemCount: Globals.globals.StudentData.length,
    itemBuilder: (context, index) => ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.blue.shade800.withOpacity(0.8),
      leading: GestureDetector(
        onTap: image,
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
                  decoration: const InputDecoration(labelText: "Student  GRID"),
                ),
                TextField(
                  controller: studentEdit[index]['std'],
                  onChanged: (value) {
                    Globals.globals.StudentData[index]['std'] = value;
                    getState();
                  },
                  decoration:
                      const InputDecoration(labelText: "Student  Standard"),
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
    separatorBuilder: (context, index) => const SizedBox(
      height: 10,
    ),
  );
}
