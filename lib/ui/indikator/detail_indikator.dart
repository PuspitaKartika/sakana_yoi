import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';

class DetailIndikator extends StatefulWidget {
  const DetailIndikator({super.key});

  @override
  State<DetailIndikator> createState() => _DetailIndikatorState();
}

class _DetailIndikatorState extends State<DetailIndikator> {
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
                "24°C",
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
                "200 cm",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }

    Widget aliranAir() {
      return Container(
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
              "5 m/s",
              style: primaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
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
