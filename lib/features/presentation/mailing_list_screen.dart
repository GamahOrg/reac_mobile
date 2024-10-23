import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/features/presentation/reply_to_the_reporter.dart';
import 'package:reac/features/presentation/widgets/mailing_list_item.dart';

import '../../app/app_assets.dart';
import '../../my_app.dart';
import 'auth_screens/widgets.dart';

class MailingListScreen extends StatelessWidget {
  const MailingListScreen({super.key});

  static const String id = "MailingListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,MyApp.tr.mailingList),
      body:  Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index){
                return InkWell(onTap: (){
                   Navigator.pushNamed(context, ReplyReporterScreen.id);
                },child: MailingListItem(owner: "صالح سعد العتيبي",image: AppAssets.icNote,message: "برجاء ارسال المرفقات الخاصة ..... ",date: "١5/3/2024",));
          
              }, separatorBuilder: (context,index){
                return SizedBox(height: 4.h);
              }, itemCount: 4)
            ],
          ),
        ),
      ),
    );
  }


}

