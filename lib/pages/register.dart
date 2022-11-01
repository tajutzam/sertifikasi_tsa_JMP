import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/controllers/register_controller.dart';
import 'package:sertifikasi_jmp/pages/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _form = GlobalKey<FormState>();
  // cari controller
  final registerC = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset('images/digital.png', height: 200),
            Text(
              'Register TSA',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Daftarkan akunmu , sekarang juga',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: registerC.usC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "username tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Masukan Username'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: registerC.passC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' Password',
                        hintText: 'Masukan Password'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: registerC.namaC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Nama Lengkap tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama Lengkap',
                        hintText: 'Masukan Nama lengkap'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: registerC.noHpC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "No telp tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Nomer telepon',
                        labelText: 'No Telepon'),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    registerC.register();
                    Get.snackbar('success', 'berhasil register');
                    Timer(
                      Duration(seconds: 3),
                      () => Get.off(() => LoginPage()),
                    );
                  }
                },
                child: Text('Submit')),
            InkWell(
              onTap: () {
                registerC.dispose();
                Get.to(LoginPage());
              },
              child: Text(
                'Login sekarang',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
