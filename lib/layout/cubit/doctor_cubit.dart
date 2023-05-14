import 'package:bloc/bloc.dart';
import 'package:doctor_app/module/appointment/appointment_screen.dart';
import 'package:doctor_app/module/my_surgery/my_surgery_screen.dart';
import 'package:doctor_app/module/settinga/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../module/appointment_track_state/appointment_track_state_page_view.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> bottomScreen = [
    AppointmentScreen(),
    AppointmentTrackStateScreen(),
    MySurgeryScreen(surgeries: [
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
      Surgery(name: "Test", patientName: "Rami Hamad", date: "2023/2/3", time: "12 PM"),
    ]),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(FamilyChangeBottomState());
  }
  
}
