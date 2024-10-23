import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reac/app/extensions.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({
    super.key,
    this.text,
    this.color,
    this.icon,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.iconColor,
    required this.vertical,
  });

  final String? text;
  final String? icon;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double vertical;
  Color? iconColor = Colors.white;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: widget.vertical, horizontal: 5.w),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius:0.5,
              spreadRadius: 1,
              offset: Offset(0,1),
              color: Color(0xfff2f2f2)
          )
        ],
        color: widget.color != null ? widget.color! : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          widget.icon != null
              ? SvgPicture.asset(
                  widget.icon!,
                  color: widget.iconColor,
                )
              : SizedBox(),
          widget.icon != null
              ? SizedBox(
                  width: 3.w,
                )
              : SizedBox(),
          Expanded(
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
