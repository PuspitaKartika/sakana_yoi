import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';

class BeriMakanScreen extends StatefulWidget {
  const BeriMakanScreen({super.key});

  @override
  State<BeriMakanScreen> createState() => _BeriMakanScreenState();
}

class _BeriMakanScreenState extends State<BeriMakanScreen> {
  bool cek = false;
  Widget manual() {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: blueColor),
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text(
          "Manual",
          style: primaryTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          "Klik untuk memberi makan secara manual",
          style: primaryTextStyle.copyWith(fontSize: 8, color: Colors.white),
        )
      ]),
    );
  }

  Widget otomatis() {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: blueColor),
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Otomatis",
          style: primaryTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "(Sehari 3x)",
          style: primaryTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Spacer(),
        Text(
          "Klik untuk memberi makan secara manual",
          style: primaryTextStyle.copyWith(fontSize: 8, color: Colors.white),
        )
      ]),
    );
  }

  Widget pengaturan() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: yellowColor),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Waktu rentang auto",
              style: primaryTextStyle.copyWith(
                  fontSize: 10, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cek = !cek;
                });
              },
              child: Text(
                "12 jam sekali",
                style: primaryTextStyle.copyWith(
                    color: cek ? Colors.white : blueColor, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: cek ? blueColor : Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  cek = !cek;
                });
              },
              child: Text(
                "24 jam sekali",
                style: primaryTextStyle.copyWith(
                    color: cek ? blueColor : Colors.white, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: cek ? Colors.white : blueColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Sisa Pakan",
          style: primaryTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 150),
                    width: 200,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "100%",
                        style: primaryTextStyle.copyWith(fontSize: 8),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                    width: 150,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "75%",
                        style: primaryTextStyle.copyWith(fontSize: 8),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    width: 100,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "50%",
                        style: primaryTextStyle.copyWith(fontSize: 8),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: 50,
                      height: 15,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "25%",
                          style: primaryTextStyle.copyWith(fontSize: 8),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("100%"),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Pengaturan Takaran Pakan (manual)",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sedikit",
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sedang",
                style:
                    primaryTextStyle.copyWith(color: blueColor, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Banyak",
                style:
                    primaryTextStyle.copyWith(color: blueColor, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Pengaturan Takaran Pakan (otomatis)",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sedikit",
                style: primaryTextStyle.copyWith(
                    color: Colors.white, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sedang",
                style:
                    primaryTextStyle.copyWith(color: blueColor, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Banyak",
                style:
                    primaryTextStyle.copyWith(color: blueColor, fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        )
      ]),
    );
  }

  @override
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
          "Makanan",
          style: primaryTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Text(
                "Pengaturan Beri Makan",
                style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 50), child: pengaturan()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      manual(),
                      SizedBox(
                        width: 30,
                      ),
                      otomatis(),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
