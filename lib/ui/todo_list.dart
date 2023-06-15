import 'package:flutter/material.dart';
import 'package:sakana_yoi/theme.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
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

  Widget history() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(children: [
          Text(
            "History TODO List",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(child: Text("lorem ipsum dolor bla  bla bla bla")),
              Icon(Icons.history)
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("lorem ipsum dolor bla  bla bla bla")),
              Icon(Icons.history)
            ],
          )
        ]),
      ),
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
            "Todo List",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            todoList(),
            SizedBox(
              height: 10,
            ),
            history()
          ]),
        ));
  }
}
