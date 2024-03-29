import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';
import 'package:timer_builder/timer_builder.dart';
import 'dart:convert';

import '../repositories/sensor_repo.dart';
import '../utils/sensor_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SensorRepo _sensorRepo = SensorRepo();
  SensorModel _sensorData = SensorModel();
  bool _isFetchingData = true;
  StreamController<void> _streamController = StreamController<void>();
  Timer? _fetchDataTimer;


  @override
  void initState() {
    super.initState();
    _startFetchingData();
    fetchSensorData();
  }

  @override
  void dispose() {
    // Cancel the periodic timer if it's still active
    _fetchDataTimer?.cancel();
    _streamController.close(); // Close the StreamController to release resources
    super.dispose();
  }


  void _startFetchingData() {
    _fetchDataTimer =  Timer.periodic(Duration(seconds: 1), (_) async {
      await fetchSensorData();
      _streamController.add(null);
    });
  }

  Future<void> fetchSensorData() async {
    String response = await _sensorRepo.getSensor();
    Map<String, dynamic> json = jsonDecode(response);
    SensorModel sensorData = SensorModel.fromJson(json);
    setState(() {
      _sensorData = sensorData;
    });
  }

  @override

  Widget header() {
    return Container(
      child: Text(
        "Hallo, Selamat pagi",
        style: primaryTextStyle.copyWith(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  //Indikator
  Widget indikator() {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context){
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detailIndikator');
        },
        child: Container(
          decoration: BoxDecoration(
              color: blueColor, borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(children: [
            Text(
              "Indikator",
              style: whiteTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Text(
                      "Tinggi aiir",
                      style: primaryTextStyle.copyWith(fontSize: 10),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${_sensorData.sensorTinggi}',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Text(
                      "Suhu Air",
                      style: primaryTextStyle.copyWith(fontSize: 10),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${_sensorData.sensorSuhu} °C",
                      //"24°C",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Text(
                      "Aliran Air",
                      style: primaryTextStyle.copyWith(fontSize: 10),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${_sensorData.sensorFlow} m/s',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ]),
                )
              ],
            )
          ]),
        ),
      );
    },

    );
  }

  Widget beriMakan() {
    return Container(
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(children: [
        Text(
          "Beri Makan",
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: yellowColor, borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Spacer(),
                Text(
                  "Manual",
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Klik untuk memberi\nmakan secara manual",
                  style: primaryTextStyle.copyWith(fontSize: 5),
                ),
              ]),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: yellowColor, borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                Spacer(),
                Text(
                  "Otomatis",
                  style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "(Sehari 3x)",
                  style: primaryTextStyle.copyWith(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Klik untuk memberi\nmakan secara otomatis",
                  style: primaryTextStyle.copyWith(fontSize: 5),
                ),
              ]),
            ),
            Container(
              child: Column(children: [
                Text(
                  "Sisa Pakan",
                  style: whiteTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "100%",
                      style: whiteTextStyle.copyWith(
                        fontSize: 8,
                      ),
                    )
                  ],
                )
              ]),
            )
          ],
        )
      ]),
    );
  }

  Widget todoList() {
    return Container(
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    size: 18,
                  ),
                  Text(
                    "  TODO LIST  ",
                    style: primaryTextStyle.copyWith(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(90)),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                  )),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                child: Row(children: [
                  Icon(Icons.filter_sharp),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "Opet, Besok mancing bozz di danau ",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_box_outlined,
                      ),
                      padding: EdgeInsets.zero),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.delete_outline,
                      )),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.edit,
                      ))
                ]),
              ),
              Container(
                child: Row(children: [
                  Icon(Icons.filter_sharp),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "Opet, Besok mancing bozz di danau ",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_box_outlined,
                      ),
                      padding: EdgeInsets.zero),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.delete_outline,
                      )),
                  IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.edit,
                      ))
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, right: 30, left: 30),
        color: backgroundColor,
        child: ListView(
          children: [
            header(),
            SizedBox(
              height: 40,
            ),
            indikator(),
            SizedBox(
              height: 30,
            ),
            beriMakan(),
            SizedBox(
              height: 30,
            ),
            todoList()
          ],
        ),
      ),
    );
  }
}
