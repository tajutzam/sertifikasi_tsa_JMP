import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/controllers/login_controller.dart';
import 'package:sertifikasi_jmp/pages/register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _form = GlobalKey<FormState>();
  // ambil controller
  final loginC = Get.find<LoginController>();
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
              'Login TSA',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Silahkan login dengan menggunakan username dan password',
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
                    controller: loginC.usC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "username tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Masukan Username '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: loginC.passC,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "username tidak boleh kosong";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Masukan Password'),
                  )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // succes
                  List<Map<String, Object?>> result = await loginC.login();
                  if (result.length != 0) {
                    loginC.dispose();
                    Get.toNamed('/home', arguments: result);
                  } else {
                    Get.snackbar(
                      colorText: Colors.black,
                      'Login gagal',
                      'User tidak tersedia',
                    );
                  }
                },
                child: Text('Login')),
            ElevatedButton(
                onPressed: () {
                  loginC.dispose();
                  Get.to(() => RegisterPage());
                },
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
