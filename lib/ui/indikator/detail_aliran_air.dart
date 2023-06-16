import 'package:flutter/material.dart';

import '../../theme.dart';

class DetailAliranAir extends StatefulWidget {
  const DetailAliranAir({super.key});

  @override
  State<DetailAliranAir> createState() => _DetailAliranAirState();
}

class _DetailAliranAirState extends State<DetailAliranAir> {
  @override
  Widget build(BuildContext context) {
    Widget Aliran() {
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
            "Aliran Air",
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Spacer(),
          Text(
            "2 m/s",
            style: primaryTextStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: 65),
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
            "Rata-rata Aliran Air",
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
            "History Aliran Air",
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
                    "2 m/s",
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
                    "1,9 m/s",
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
          "Detail Aliran Air",
          style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Aliran(),
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
