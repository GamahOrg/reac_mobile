import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/my_app.dart';

import '../../../app/app_assets.dart';
class MailingListItem extends StatelessWidget {
  const MailingListItem({
    super.key,
    this.image,this.message,this.date,this.owner
  });

  final String? image;
  final String? date;
  final String? owner;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
              decoration: BoxDecoration(
                color: const Color(0xffE7E7E7),
                borderRadius: BorderRadius.circular(3.0),
              ),
              height: 35,
              width: 34,
              child: Center(child: SvgPicture.asset(image??"")),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              owner??"",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff3F3E43)),
            ),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset(AppAssets.icCalendar),
                SizedBox(width: 2.w,),
                Text(date??"",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff61686B))),
              ],
            )
          ],
        ),
        SizedBox(height: 3.h,),
        Row(
          children: [
            Text(
              MyApp.tr.message,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff61686B),
              ),
            ),
            SizedBox(width: 8.w,),
            Expanded(
              child: Text(
                message??"",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xff3F3E43)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
