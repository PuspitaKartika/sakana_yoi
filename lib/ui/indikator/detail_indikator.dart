import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';

import '../../repositories/sensor_repo.dart';
import '../../utils/sensor_model.dart';

class DetailIndikator extends StatefulWidget {
  const DetailIndikator({super.key});

  @override
  State<DetailIndikator> createState() => _DetailIndikatorState();
}

class _DetailIndikatorState extends State<DetailIndikator> {
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
  Widget build(BuildContext context) {
    Widget suhuAir() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/suhuAir');
        },
        child: Container(
          width: 120,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: backgroundColor),
          child: Column(
            children: [
              Text(
                "Suhu Air",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/suhuAir.png",
                width: 35,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${_sensorData.sensorSuhu}°C",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    Widget TinggiAir() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/tinggiAir');
        },
        child: Container(
          width: 120,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: backgroundColor),
          child: Column(
            children: [
              Text(
                "Tinggi Air",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/tinggiAir.png",
                width: 70,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${_sensorData.sensorTinggi}",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    Widget aliranAir() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/aliranAir');
        },
        child: Container(
          width: 120,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: backgroundColor),
          child: Column(
            children: [
              Text(
                "Aliran Air",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/aliranAir.png",
                width: 70,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${_sensorData.sensorFlow} m/s",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    Widget warning() {
      return Container(
          height: 175,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
              ),
              color: lightBlueColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NO WARNING",
                style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "ALL GOOD",
                style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Indikator",
          style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: blueColor
                    // border: Border.all(color: blueColor)
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        suhuAir(),
                        SizedBox(
                          height: 60,
                        ),
                        aliranAir()
                      ],
                    ),
                    TinggiAir()
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              warning()
            ],
          )),
    );
  }
}
