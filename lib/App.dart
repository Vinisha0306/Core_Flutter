import 'package:extra/routes.dart';

import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.detailPage: (context) => DetailsPage(),
      },
    );
  }
}
