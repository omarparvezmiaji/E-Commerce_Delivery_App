import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double roundness;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  //final Widget trailingWidget;
  final Function onPressed;

  const AppButton({
    required this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    //required this.trailingWidget,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundness),
        ),
        color: AppColors.primaryColor,
        textColor: AppColors.lightColor,
        elevation: 10.0,
        padding: padding,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            // if (trailingWidget != null)
            //   Positioned(
            //     top: 0,
            //     right: 25,
            //     child: trailingWidget,
            //   )
          ],
        ),
        onPressed: () {
          if (onPressed != null) onPressed();
        },
      ),
    );
  }
}
