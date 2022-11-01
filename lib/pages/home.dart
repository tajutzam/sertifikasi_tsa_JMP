import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertifikasi_jmp/pages/dashboard.dart';
import 'package:sertifikasi_jmp/pages/profile.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var dataUser = Get.arguments;
  final switchC = Get.put(SwicthController());

  List data = [
    dataBody(dataUser: Get.arguments),
    DashboardScrenn(dataUser: Get.arguments),
    ProfileDart(dataUser: Get.arguments),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () {
          return data[switchC.count.value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:switchC.count.value,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            switchC.count.value = value;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          ] , ),
    );
  }
}

class dataBody extends StatelessWidget {
  const dataBody({
    Key? key,
    required this.dataUser,
  }) : super(key: key);

  final dataUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

            ),
            child: Text(
              "Selamat Datang ${dataUser[0]['nama_lengkap']}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

            ),
            child: Text(
              "Username : ${dataUser[0]['username']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

            ),
            child: Text(
              "Password ${dataUser[0]['password']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

            ),
            child: Text(
              "nama lengkap : ${dataUser[0]['nama_lengkap']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(

            ),
            child: Text(
              "No Hp : ${dataUser[0]['noHp']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}

class SwicthController extends GetxController {
  var count = 0.obs;
}
