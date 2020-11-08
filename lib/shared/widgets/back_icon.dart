part of '../shared.dart';

Widget backIcon(BuildContext parentContext, {Function onTap}) {
  return GestureDetector(
    onTap: () {
      if (onTap == null) {
        Navigator.pop(parentContext);
      } else {
        onTap();
      }
    },
    child: Icon(
      Icons.arrow_back,
    ),
  );
}
