import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/main_screen_cubit.dart';
import 'package:reac/main_screen_states.dart';
import 'package:reac/my_app.dart';

import 'app/constants.dart';
class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MainScreenCubit(),
      child: BlocConsumer<MainScreenCubit,MainScreenStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=MainScreenCubit.get(context);
          return Scaffold(
            body: cubit.pages[cubit.selectedIndex],
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(AppAssets.icHome,MyApp.tr.main, 0,cubit),
                  _buildNavItem(AppAssets.icBook, MyApp.tr.suits, 1,cubit),
                  _buildNavItem(AppAssets.icLanguageSquare, MyApp.tr.element2, 2,cubit),
                  _buildNavItem(AppAssets.icMenu,MyApp.tr.element4, 3,cubit),
                ],
              ),
            ),
          );
        },
        
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index,MainScreenCubit mainScreenCubit) {
    final bool isSelected = mainScreenCubit.selectedIndex == index;
    return InkWell(
      onTap: () => mainScreenCubit.changeIndexBottomNavigationBar(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected?    Container(
            width: 20.w,
            height: 0.4.h,
            decoration: const BoxDecoration(
              color: Color(0xff002F56),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
            ),
          ):const SizedBox(),
         Padding(
           padding:  EdgeInsets.only(top: 1.5.h,bottom:3.h),
           child: Column(
             children: [
               SvgPicture.asset(icon, color: isSelected ? const Color(0xff002F56) : const Color(0xff879094),width: 7.w,height: 3.h,),
               SizedBox(height: 1.h,),
               Text(
                 label,
                 style: TextStyle(
                   fontSize: 12.sp,
                   fontWeight: FontWeight.w700,
                   color:  isSelected ? const Color(0xff002F56) : const Color(0xff879094),
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}

