import 'package:bloc/bloc.dart';
import 'package:doctor_app/layout/cubit/doctor_cubit.dart';
import 'package:doctor_app/layout/doctor_layout.dart';
import 'package:doctor_app/module/auth_pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  bool isLoggedIn =await CacheHelper.getData(key: 'isLoggedIn') ?? false;
  runApp( MyApp(isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => DoctorCubit(),
          ),


        ],
        child: BlocConsumer<DoctorCubit, DoctorState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                home: isLoggedIn? DoctorLayout() : LoginScreen(),
              );
            }));

  }
}



