import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key : key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool makan = false;
  int sensorFlow = 0;
  double sensorFlowTotal = 0.0;
  double sensorSuhu = 0.0;
  String sensorTinggi = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://sakanayoi-ikan-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        makan = data['makan'] ?? false;
        sensorFlow = data['sensorFlow'] ?? 0;
        sensorFlowTotal = data['sensorFlowTotal'] ?? 0.0;
        sensorSuhu = data['sensorSuhu'] ?? 0.0;
        sensorTinggi = data['sensorTinggi'] ?? '';
      });
    } else {
      print('Failed to fetch data from the server');
    }
  }
  //final DatabaseReference _database = FirebaseDatabase.instance.ref();
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
                    sensorTinggi,
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
                    "${sensorSuhu} °C",
                    //"24°C",
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
                    sensorFlow.toString(),
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
      ),
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
