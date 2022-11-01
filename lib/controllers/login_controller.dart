import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/database/sqlhelper.dart';
import 'package:sertifikasi_jmp/model/user.dart';
import 'package:sertifikasi_jmp/services/login_service.dart';

class LoginController extends GetxController {
  final usC = TextEditingController();
  final passC = TextEditingController();

  login() async {
    final userModel = UserModel();
    userModel.username = usC.text;
    userModel.password = passC.text;
    List<Map<String, Object?>> data = await LoginService.login(userModel);
    return data;
  }

  static findAll() async {
    print(await LoginService.findAll());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    LoginController.findAll();
  }

  @override
  void dispose() {
    usC.clear();
    passC.clear();
  }
}
