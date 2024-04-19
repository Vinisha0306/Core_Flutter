import 'package:extra/headers.dart';

SnackBar MySnackBar({required color, required context}) {
  return SnackBar(
    content: Text(context),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
  );
}
