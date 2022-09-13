// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/constants/constants.dart';

class LTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final VoidCallback? onSuffixPressed;
  final Widget? suffix;
  final Function(String)? validator;
  final TextEditingController? controller;
  final int? maxlines;
  final bool isMandatory;
  final Widget? prefix;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? style;
  final int? maxlength;
  final bool readOnly;
  const LTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.errorText,
    required this.obscureText,
    this.onSuffixPressed,
    this.suffix,
    this.validator,
    this.controller,
    this.maxlines,
    required this.isMandatory,
    this.prefix,
    this.autovalidateMode,
    this.style,
    this.maxlength,
    this.readOnly=false,
  }) : super(key: key);

  @override
  State<LTextField> createState() => _LTextFieldState();
}

class _LTextFieldState extends State<LTextField> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            children: [
              Text(widget.labelText ?? "",
                  style: textTheme.headline2?.copyWith(fontSize: 16.h)
                  //  TextStyle(
                  //     fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
                  ),
              SizedBox(width: 0.7.h),
              widget.isMandatory
                  ? Text('*',
                      style: textTheme.button?.copyWith(color: Colors.red)
                      //  TextStyle(
                      //     color: Colors.red, fontWeight: FontWeight.bold,
                      //     fontSize: size.height * 0.023),
                      )
                  : const Text(''),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          readOnly:widget.readOnly,
          autovalidateMode: widget.autovalidateMode,
          maxLines: widget.maxlines ?? 1,
          maxLength:widget.maxlength ?? 1000,
          obscureText: widget.obscureText,
          controller: widget.controller,
          validator: (val) => widget.validator!(val!),
          style: widget.style,
          decoration: InputDecoration(
            // labelStyle: const TextStyle(color: Colors.black),
            hintStyle: textTheme.button?.copyWith(color: Colors.grey.shade400),
            // const TextStyle(fontSize: 14.0, color: Colors.black26),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            // labelText: widget.labelText,
            errorText: widget.errorText,
            hintText: widget.hintText,
            suffix: widget.suffix == null
                ? null
                : GestureDetector(
                    onTap: () {
                      widget.onSuffixPressed!();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 8),
                      child: widget.suffix,
                    ),
                  ),
            prefixIcon: widget.prefix == null
                ? null
                : Container(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.prefix,
                  )),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: NColors.sideColor,
                // style: BorderStyle.solid
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: NColors.sideColor, style: BorderStyle.solid),
            ),
          ),
        ),
      ],
    );
  }
}
