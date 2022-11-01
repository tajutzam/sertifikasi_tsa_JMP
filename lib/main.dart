import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/controllers/location_controller.dart';
import 'package:sertifikasi_jmp/controllers/login_controller.dart';
import 'package:sertifikasi_jmp/controllers/register_controller.dart';
import 'package:sertifikasi_jmp/pages/home.dart';

import 'package:sertifikasi_jmp/pages/login.dart';
import 'package:sertifikasi_jmp/pages/register.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // daftar controller
    final loginC = Get.put(LoginController());
    final registerC = Get.put(RegisterController());
    final locationC = Get.put(LocationController());
    
    
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: '/home', page: () => HomePage(), transition: Transition.fade),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(
            name: '/register',
            page: () => RegisterPage(),
            transition: Transition.leftToRight),
      ],
      home: LoginPage(),
    );
  }
}
