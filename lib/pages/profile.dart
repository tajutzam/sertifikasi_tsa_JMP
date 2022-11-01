import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/controllers/register_controller.dart';

class ProfileDart extends StatelessWidget {
  const ProfileDart({
    Key? key,
    required this.dataUser,
  }) : super(key: key);

  final dataUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              "profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Form(
          key: Get.find<RegisterController>().form,
          child: Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "username tidak boleh kosong";
                      }
                    },
                    controller: Get.find<RegisterController>().usCT,
                    // initialValue: dataUser[0]['username'],
                    decoration: InputDecoration(
                      labelText: "Username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "password tidak boleh kosong";
                      }
                    },
                    controller: Get.find<RegisterController>().passCT,
                    // initialValue: dataUser[0]['password'],
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "nama tidak boleh kosong";
                      }
                    },
                    controller: Get.find<RegisterController>().namaCT,
                    // initialValue: dataUser[0]['nama_lengkap'],
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "no hp tidak boleh kosong";
                      }
                    },
                    controller: Get.find<RegisterController>().noHpCT,
                    // initialValue: dataUser[0]['noHp'],
                    decoration: InputDecoration(
                      labelText: "No Hp",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (Get.find<RegisterController>()
                            .form
                            .currentState!
                            .validate()) {
                          var result = await Get.find<RegisterController>()
                              .updateData(dataUser[0]['id']);
                          if (result == 1) {
                            Get.snackbar('success',
                                'berhasil update data , Login ulang');
                            Timer(
                              Duration(seconds: 3),
                              () {
                                Get.find<RegisterController>().dispose();
                                Get.offNamed('/login');
                              },
                            );
                          } else {
                            Get.snackbar('gagal', 'terjadi kesalahan');
                          }
                        }
                      },
                      child: Text('update')),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
