import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';

class IndikatorScreen extends StatefulWidget {
  const IndikatorScreen({super.key});

  @override
  State<IndikatorScreen> createState() => _IndikatorScreenState();
}

class _IndikatorScreenState extends State<IndikatorScreen> {
  @override
  Widget baik() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                color: greyColor.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Column(children: [
        Icon(
          Icons.thumb_up,
          size: 30,
        ),
        Text(
          "Baik",
          style: primaryTextStyle.copyWith(),
        )
      ]),
    );
  }

  Widget indikator() {
    return Container(
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.22,
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
                  "200 cm",
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.22,
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
                  "24°C",
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.22,
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
                  "5 m/s",
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
              ]),
            )
          ],
        )
      ]),
    );
  }

  Widget pemberitahuan() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Text("Pemberitahuan"),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            Expanded(
              child: Text(
                "Pemberitahuan Suhu Tinggi (Batas Atas: 30C)",
                overflow: TextOverflow.clip,
              ),
            )
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            Expanded(
              child: Text(
                "Pemberitahuan Suhu Tinggi (Batas Atas: 30C)",
                overflow: TextOverflow.clip,
              ),
            )
          ],
        )
      ]),
    );
  }

  Widget historis() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        Text("Historis"),
        SizedBox(
          height: 10,
        ),
        Text("13/05/2023 - Suhu: 27C, pH: 7.5, Oksigen: 6ppm"),
        SizedBox(
          height: 5,
        ),
        Text("12/05/2023 - Suhu: 26C, pH: 7.2, Oksigen: 5ppm")
      ]),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
            onPressed: () {},
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
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 50), child: indikator()),
                Center(child: baik())
              ],
            ),
          ),
          pemberitahuan(),
          historis()
        ],
      )),
    );
  }
}
