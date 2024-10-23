import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reac/features/presentation/home/claims_screen.dart';
import 'package:reac/features/presentation/element2_screen.dart';
import 'package:reac/features/presentation/minutes_of_settlement.dart';
import 'package:reac/features/presentation/home_screen.dart';
import 'package:reac/main_screen_states.dart';
class MainScreenCubit extends Cubit<MainScreenStates>{
  MainScreenCubit():super(InitialState());
  static MainScreenCubit get(context)=>BlocProvider.of(context);
  int selectedIndex = 1;
  void changeIndexBottomNavigationBar(int index) {
      selectedIndex = index;
       emit(ChangeIndexBottonNavigationBarSuccessState());
  }
  List<Widget> pages=[
     HomeScreen(),
     ClaimsScreen(),
     HomeScreen(),
     HomeScreen()
  ];
}