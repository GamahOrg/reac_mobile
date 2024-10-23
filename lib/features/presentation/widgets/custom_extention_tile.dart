import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final Widget? leading;
  final List<Widget> children;
  final String? expandedIcon;
  final String? collapsedIcon;
  bool? initiallyExpanded = false;
  bool? canExpand = true;
  bool isLoading=true;
  bool isShadow;
  bool isPaddingTitle;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;

  CustomExpansionTile(
      {super.key,
        required this.title,
        this.leading,
        required this.children,
        this.expandedIcon,required this.isLoading,
        this.isShadow=true,
        this.collapsedIcon,
        this.canExpand,
        this.isPaddingTitle=true,
        this.fontWeight=FontWeight.w700,
        this.color=const Color(0xff61686B),this.fontSize=14,
        this.initiallyExpanded});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:widget.isShadow? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              blurRadius:0.5,
              spreadRadius: 1,
              offset: Offset(0,1),
              color: Color(0xfff2f2f2)
          )
        ],
      ):const BoxDecoration(),
      child: IgnorePointer(
        ignoring: false,
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded??false,
          tilePadding:widget.isPaddingTitle? EdgeInsets.only(left: 3.w, right: 3.w, bottom: 1.h):EdgeInsets.zero,
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          shape: InputBorder.none,
          leading: widget.isLoading? widget.leading:null,
          trailing: widget.expandedIcon != null
              ? _isExpanded
              ? SvgPicture.asset(widget.expandedIcon!)
              : SvgPicture.asset(widget.collapsedIcon!)
              : const SizedBox.shrink(),
          title: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: widget.fontSize,
                  color: AppColors.textTitleLightGrey,
                ),
              ),
          children: widget.children,
        ),
      ),
    );
  }
}
