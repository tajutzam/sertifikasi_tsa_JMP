import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sertifikasi_jmp/controllers/location_controller.dart';

class DashboardScrenn extends StatelessWidget {
  const DashboardScrenn({
    Key? key,
    required this.dataUser,
  }) : super(key: key);

  final dataUser;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Text(
              "Location",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset.fromDirection(1, 2))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Kordinat',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Text(
                    'long : ${Get.find<LocationController>().myPosition.value.longitude}    lat : ${Get.find<LocationController>().myPosition.value.latitude}',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Address ',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                    child: Obx(
                  () => Text(
                    Get.find<LocationController>().address.value == ""
                        ? "Get Kordinat dulu"
                        : Get.find<LocationController>().address.value,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          // get kordinat
                          final conC = Get.find<LocationController>();
                          conC.getLokasi();
                          conC.update();
                        },
                        child: Text('Get Kordinat')),
                    ElevatedButton(
                        onPressed: () async {
                          // get adress
                          var lat = Get.find<LocationController>()
                              .myPosition
                              .value
                              .latitude;
                          var long = Get.find<LocationController>()
                              .myPosition
                              .value
                              .longitude;
                          final availableMaps = await MapLauncher.installedMaps;
                          await availableMaps.first.showMarker(
                            coords: Coords(lat, long),
                            title: "Lokasi TSA",
                          );
                        },
                        child: Text('Get Maps'))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
