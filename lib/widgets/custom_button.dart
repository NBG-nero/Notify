import 'package:flutter/material.dart';

class LButton extends StatefulWidget {
  final Color? color;
  final double? minWidth;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final ShapeBorder? shape;
  final String? buttontext;
  final Color? buttonTextCor;
  final Color? sideColor;
  final double? width;

  const LButton({
    Key? key,
    this.color,
    this.minWidth,
   required this.onPressed,
    this.padding,
    this.child,
    this.shape,
    this.buttontext,
    this.buttonTextCor,
    this.sideColor,
    this.width,
  }) : super(key: key);

  @override
  State<LButton> createState() => _LButtonState();
}

class _LButtonState extends State<LButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: widget.color ?? const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: widget.sideColor ?? Colors.transparent),
      ),
      minWidth:widget.minWidth ?? MediaQuery.of(context).size.width * 0.90 ,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: widget.onPressed!,
      child: widget.child ?? Text(widget.buttontext ?? 'buttontext',
          style: Theme.of(context).textTheme.button?.copyWith(

              color: widget.buttonTextCor ?? Colors.white) 
              // ??
          // TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: widget.buttonTextCor ?? Colors.white),
          ),
    );
  }
}
