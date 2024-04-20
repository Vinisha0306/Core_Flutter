import 'package:extra/Page/add_Student_page/add_Student_page.dart';
import 'package:extra/routes.dart';

import 'Page/Splash_Page/splash_page.dart';
import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade900,
      ),
      routes: {
        MyRoutes.splashPage: (context) => SpleshScreen(),
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.detailPage: (context) => DetailsPage(),
        MyRoutes.addStudentPage: (context) => AddStudentPage(),
      },
    );
  }
}
