part of '../shared.dart';

/// Custom Raised Button
///
/// * Function `onClick` must `Future<void> Function()`
///
class ActionButton extends StatefulWidget {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color textColor;
  final String text;

  ActionButton({
    @required this.text,
    @required this.onClick,
    this.buttonColor,
    this.textColor,
  });

  @override
  _ActionButtonState createState() => _ActionButtonState(
        this.onClick,
        this.buttonColor,
        this.textColor,
        this.text,
      );
}

class _ActionButtonState extends State<ActionButton> {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color textColor;
  final String text;

  _ActionButtonState(
    this.onClick,
    this.buttonColor,
    this.textColor,
    this.text,
  );

  bool isOnProgress = false;
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isOnProgress) {
          isOnProgress = true;
          setState(() {
            onHover = false;
          });
          onClick().whenComplete(() {
            setState(() {
              isOnProgress = false;
            });
          });
        }
      },
      onTapDown: (detail) {
        setState(() {
          onHover = true;
        });
      },
      onTapCancel: () {
        setState(() {
          onHover = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 38.w,
          horizontal: 58.w,
        ),
        decoration: BoxDecoration(
          boxShadow: (onHover) ? [] : boxShadowBottom,
          borderRadius: BorderRadius.circular(12),
          color: (isOnProgress)
              ? Colors.grey.withOpacity(0.5)
              : buttonColor ?? Colors.green,
        ),
        child: TextFormat(
          text ?? "",
          fontSize: 38.w,
          fontColor: textColor ?? Colors.white,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
