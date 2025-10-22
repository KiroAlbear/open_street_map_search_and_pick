import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  const WideButton(
    this.text, {
    Key? key,
    required,
    this.isLoading = false,
    this.padding = 0.0,
    this.height = 45,
    this.loadingWidget,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.width = double.infinity,
    this.setLocationButtonBorderRadious = 100,
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  }) : super(key: key);

  /// Should be inside a column, row or flex widget
  final String text;
  final double padding;
  final double height;
  final double width;
  final bool isLoading;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Color foregroundColor;
  final double setLocationButtonBorderRadious;
  final void Function() onPressed;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width <= 500
          ? MediaQuery.of(context).size.width
          : width,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(setLocationButtonBorderRadious),
            ),
          ),
          onPressed: () {
            if (!isLoading) {
              onPressed();
            }
          },
          child: isLoading && loadingWidget != null
              ? loadingWidget
              : Text(text, style: textStyle),
        ),
      ),
    );
  }
}
