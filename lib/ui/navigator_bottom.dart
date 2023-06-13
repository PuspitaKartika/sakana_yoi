import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';
import 'package:sakana_yoi/ui/beri_makan.dart';
import 'package:sakana_yoi/ui/home_screen.dart';
import 'package:sakana_yoi/ui/indikator_screen.dart';
import 'package:sakana_yoi/ui/todo_list.dart';

class NavigatorButton extends StatefulWidget {
  const NavigatorButton({Key? key}) : super(key: key);

  @override
  State<NavigatorButton> createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  int currentIndex = 0;
  List pages = [
    HomeScreen(),
    IndikatorScreen(),
    BeriMakanScreen(),
    TodoListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          backgroundColor: blueColor,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/home.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/pc.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/noted.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Image.asset('assets/ceklis.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
