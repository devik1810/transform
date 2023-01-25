import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  String uri = "";

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter the name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "Please Enter the valid numbar";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        timerSnackbar(
                            context: context,
                            contentText: "Update is success",
                            afterTimeExecute: () => print("done"),
                            second: 5);
                      },
                      child: Text("Snackbar")),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       if (formkey.currentState!.validate()) {
                  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //             content:
                  //                 Text("${txtName.text}")));
                  //       }
                  //     },
                  //     child: Text("Submit"))
                ],
              ),
            ),
          ),
        ));
  }
}
