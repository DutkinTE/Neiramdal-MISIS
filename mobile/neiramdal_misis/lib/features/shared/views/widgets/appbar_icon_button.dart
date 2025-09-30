import 'dart:ui';
import 'package:flutter/material.dart';

class AppBarIconButton extends StatefulWidget {
  final Widget icon;
  final Function func;
  final double? width;
  const AppBarIconButton({
    super.key,
    required this.func,
    required this.icon,
    this.width,
  });

  @override
  State<AppBarIconButton> createState() => _AppBarIconButtonState();
}

class _AppBarIconButtonState extends State<AppBarIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.func(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: widget.width,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(40, 62, 149, 0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(0, 0, 0, 0),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),

            child: widget.icon,
          ),
        ),
      ),
    );
  }
}
