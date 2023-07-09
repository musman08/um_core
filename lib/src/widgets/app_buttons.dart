import 'package:flutter/material.dart';
import 'package:um_core/src/base/theme/theme_values_constants.dart';


class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.isFullWidth,
    this.borderColor,
    this.radius,
    this.isCircle
  }) : super(key: key);


  final void Function() onPressed;
  final Color ? backgroundColor;
  final Color ? foregroundColor;
  final Color ? borderColor;
  final bool isFullWidth;
  final Widget child;
  final double? radius;
  final bool ? isCircle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        minimumSize: isFullWidth ? const Size(double.infinity, 50) : Size.fromHeight(50),
        shape: isCircle == true  ? const CircleBorder() : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( radius ?? 15),
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 2)
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(4),
      ),
        onPressed: onPressed,
        child: child
    );
  }
}
