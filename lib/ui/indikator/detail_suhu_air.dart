import 'package:flutter/material.dart';

import '../../theme.dart';

class DetailSuhuAir extends StatefulWidget {
  const DetailSuhuAir({super.key});

  @override
  State<DetailSuhuAir> createState() => _DetailSuhuAirState();
}

class _DetailSuhuAirState extends State<DetailSuhuAir> {
  @override
  Widget build(BuildContext context) {
    Widget suhu() {
      return Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
            color: lightBlueColor),
        child: Column(children: [
          Text(
            "Suhu Air",
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Spacer(),
          Text(
            "24°C",
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: 77),
          ),
          Spacer(),
          Text(
            "Normal",
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ]),
      );
    }

    Widget rata() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 205,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: blueColor),
        child: Column(children: [
          Text(
            "Rata-rata Suhu Air",
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          )
        ]),
      );
    }

    Widget history() {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: blueColor),
        child: Column(children: [
          Text(
            "History Suhu Air",
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: lightBlueColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "23/05/2023",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "23°C",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: lightBlueColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "23/05/2023",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "23°C",
                    style: primaryTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      );
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
          "Detail Suhu Air",
          style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              suhu(),
              SizedBox(
                height: 40,
              ),
              rata(),
              SizedBox(
                height: 30,
              ),
              history()
            ],
          )),
    );
  }
}
