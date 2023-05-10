import 'package:bloc/bloc.dart';
import 'package:doctor_app/module/appointment/appointment_screen.dart';
import 'package:doctor_app/module/auth_pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../module/appointment/calendar_screen.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> bottomScreen = [
    AppointmentScreen(),
    LoginScreen(),
    AppointmentScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(FamilyChangeBottomState());
  }
  
}
