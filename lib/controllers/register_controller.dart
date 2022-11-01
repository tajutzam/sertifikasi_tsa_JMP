import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/database/sqlhelper.dart';
import 'package:sertifikasi_jmp/model/user.dart';
import 'package:sertifikasi_jmp/services/login_service.dart';
import 'package:sertifikasi_jmp/services/register_service.dart';
import 'package:sertifikasi_jmp/services/user_service.dart';

class RegisterController extends GetxController {
  final usC = TextEditingController();
  final passC = TextEditingController();
  final namaC = TextEditingController();
  final noHpC = TextEditingController();

  final usCT = TextEditingController();
  final passCT = TextEditingController();
  final namaCT = TextEditingController();
  final noHpCT = TextEditingController();

  final form = GlobalKey<FormState>();

  register() async {
    final userModel = UserModel();
    userModel.username = usC.text;
    userModel.password = passC.text;
    userModel.name = namaC.text;
    userModel.noHp = noHpC.text;
    var data = await RegisterService.register(userModel);
    print(data);
  }

  Future<int> updateData(id) async {
    final userModel = UserModel();
    userModel.username = usCT.text;
    userModel.name = namaCT.text;
    userModel.noHp = noHpCT.text;
    userModel.password = passCT.text;
    return await UserService.updateData(userModel, id);
  }

  @override
  // TODO: implement onDelete
  void dispose() {
    // TODO: implement dispose
    usC.clear();
    passC.clear();
    namaC.clear();
    noHpC.clear();
    usCT.clear();
    passCT.clear();
    namaCT.clear();
    noHpCT.clear();
  }

  
}
