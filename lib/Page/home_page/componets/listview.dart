import 'package:extra/headers.dart';

Widget listView() {
  return ListView.separated(
    itemCount: allStudentData.length,
    itemBuilder: (context, index) => ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.primaries[index % 18].withOpacity(0.6),
      leading: CircleAvatar(
        radius: 40,
        foregroundImage: NetworkImage(allStudentData[index].image),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name : ${allStudentData[index].name}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Text(
            "GRID : ${allStudentData[index].grid}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            "Standard : ${allStudentData[index].std}",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit,
        ),
      ),
    ),
    separatorBuilder: (context, index) => const SizedBox(
      height: 10,
    ),
  );
}
