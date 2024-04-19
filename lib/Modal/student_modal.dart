class Student {
  final String name;
  final String grid;
  final String std;
  final String image;

  Student(
      {required this.name,
      required this.grid,
      required this.std,
      required this.image});

  factory Student.formMap({required Map data}) => Student(
      name: data['name'],
      grid: data['grid'],
      std: data['std'],
      image: data['image']);

  Map<String, dynamic> get toMap => {
        'name': name,
        'grid': grid,
        'std': std,
        'image': image,
      };
}
