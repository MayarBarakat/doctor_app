import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_app/layout/cubit/doctor_cubit.dart';
import 'package:doctor_app/layout/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../shared/components/constants.dart';
import '../shared/components/size_config.dart';




class DoctorLayout extends StatefulWidget {


  @override
  State<DoctorLayout> createState() => _DoctorLayoutState();
}

class _DoctorLayoutState extends State<DoctorLayout> {

  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    var cubit = DoctorCubit.get(context);
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[300],

            body: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.bottomScreen,
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xff30384c),
                  borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(bottomNavs.length,
                            (index) =>GestureDetector(
                      onTap: (){
                        bottomNavs[index].input!.change(true);
                        if(bottomNavs[index] != selectedBottomNav){
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }
                        cubit.changeBottom(index);
                        Future.delayed( Duration(seconds: 1),(){
                          bottomNavs[index].input!.change(false);

                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(bottom: 2),
                            height: 4,
                            width: bottomNavs[index] == selectedBottomNav? 20 : 0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF81B4FF),
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            )),
                          SizedBox(
                              height: 36,
                              width: 36,
                              child: Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav? 1: 0.5,
                                child: RiveAnimation.asset(
                                  bottomNavs.first.src,
                                  artboard: bottomNavs[index].artBoard,
                                  onInit: (artboard){
                                    StateMachineController controller = RiveUtils.getRiveController(
                                        artboard,
                                        stateMachineName: bottomNavs[index].stateMachineName
                                    );
                                    bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              ),
                            ),

                        ],
                      ),
                    )
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
class RiveAsset{
  final String artBoard, stateMachineName,title,src;
  late SMIBool? input;

  RiveAsset(this.src,{
    required this.artBoard,
   required this.stateMachineName,
    required this.title,
     this.input

  });

  set setInput(SMIBool status){
    input = status;
  }
}

List<RiveAsset>bottomNavs = [
  RiveAsset("assets/images/icons.riv", artBoard: "HOME", stateMachineName: "HOME_interactivity", title: "Home"),
  RiveAsset("assets/images/icons.riv", artBoard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAsset("assets/images/icons.riv", artBoard: "TIMER", stateMachineName: "TIMER_Interactivity", title: "Timer"),
];