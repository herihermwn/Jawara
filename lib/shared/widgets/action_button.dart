part of '../shared.dart';

class ActionButton extends StatelessWidget {
  final Function onClick;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final bool isActive;

  ActionButton({
    @required this.text,
    @required this.onClick,
    @required this.isActive,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isActive) ? onClick : () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(
          vertical: 30.w,
          horizontal: 58.w,
        ),
        decoration: BoxDecoration(
          boxShadow: (isActive) ? boxShadowBottom : [],
          borderRadius: BorderRadius.circular(12),
          color: (!isActive) ? disableButton : buttonColor ?? Colors.green,
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
