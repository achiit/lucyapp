// import 'package:control_pad_plus/views/joystick_view.dart';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:lucyapp/MVVM/view_models/remotecontrol_VM.dart';
import 'package:lucyapp/widgets/circle.dart';
import 'package:lucyapp/widgets/joystickview.dart';
import 'package:provider/provider.dart';

class RemoteControlPage extends StatefulWidget {
  @override
  _RemoteControlPageState createState() => _RemoteControlPageState();
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  void callback(x, y) {
    log('callback x => $x and y $y');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //leading: Icon(Icons.tv),
        title: Text('LUCY REMOTE'),
        titleSpacing: 2.0,
        //backgroundColor: Colors.white24,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 10.0, sigmaY: 10.0), // Adjust blur values
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/lucylogo.jpeg",
                      // height: 300,
                      // width: 300,
                    ), // Adjust image size
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Left Hand",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        height: 156,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setLeftHandMovement(
                                        Movement.anticlockwise);
                              },
                              onLongPressEnd: (details) {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setLeftHandMovement(Movement.stop);
                              },
                              child: IconButton(
                                  onPressed: () {
                                    print('LEFT HAND ANTI');
                                  },
                                  icon: Icon(Icons.arrow_drop_up)),
                            ),
                            Text(
                              'Stop',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onLongPress: () {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setLeftHandMovement(Movement.clockwise);
                              },
                              onLongPressEnd: (details) {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setLeftHandMovement(Movement.stop);
                              },
                              child: IconButton(
                                  onPressed: () {
                                    print("left hand clockwise");
                                  },
                                  icon: Icon(Icons.arrow_drop_down)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Container(
                          height: 150,
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  Provider.of<RemoteControlViewModel>(context,
                                          listen: false)
                                      .setMovement(Movement.up);
                                },
                                onLongPressEnd: (details) {
                                  Provider.of<RemoteControlViewModel>(context,
                                          listen: false)
                                      .setMovement(Movement.stop);
                                },
                                child: IconButton(
                                  onPressed: () {
                                    print('Volume Up');
                                  },
                                  icon: Icon(
                                    Icons.arrow_upward,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      Provider.of<RemoteControlViewModel>(
                                              context,
                                              listen: false)
                                          .setMovement(Movement.left);
                                    },
                                    onLongPressEnd: (details) {
                                      Provider.of<RemoteControlViewModel>(
                                              context,
                                              listen: false)
                                          .setMovement(Movement.stop);
                                    },
                                    child: IconButton(
                                      onPressed: () {
                                        print('Volume Left');
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink[100],
                                          fontSize: 12,
                                        ),
                                      )),
                                  GestureDetector(
                                    onLongPress: () {
                                      Provider.of<RemoteControlViewModel>(
                                              context,
                                              listen: false)
                                          .setMovement(Movement.right);
                                    },
                                    onLongPressEnd: (details) {
                                      Provider.of<RemoteControlViewModel>(
                                              context,
                                              listen: false)
                                          .setMovement(Movement.stop);
                                    },
                                    child: IconButton(
                                      onPressed: () {
                                        print('Volume Right');
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  Provider.of<RemoteControlViewModel>(context,
                                          listen: false)
                                      .setMovement(Movement.down);
                                },
                                onLongPressEnd: (details) {
                                  Provider.of<RemoteControlViewModel>(context,
                                          listen: false)
                                      .setMovement(Movement.stop);
                                },
                                child: IconButton(
                                  onPressed: () {
                                    print('Volume Down');
                                  },
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Column(
                    children: [
                      Text(
                        "Right Hand",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        height: 156,
                        width: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setRightHandMovement(
                                        Movement.anticlockwise);
                              },
                              onLongPressEnd: (details) {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setRightHandMovement(Movement.stop);
                              },
                              child: IconButton(
                                  onPressed: () {
                                    print('RIGHT HAND ANTI');
                                  },
                                  icon: Icon(Icons.arrow_drop_up)),
                            ),
                            Text(
                              'Stop',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onLongPress: () {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setRightHandMovement(Movement.clockwise);
                              },
                              onLongPressEnd: (details) {
                                Provider.of<RemoteControlViewModel>(context,
                                        listen: false)
                                    .setRightHandMovement(Movement.stop);
                              },
                              child: IconButton(
                                  onPressed: () {
                                    print("rights hand clockwise");
                                  },
                                  icon: Icon(Icons.arrow_drop_down)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setHeadMovement(Movement.anticlockwise);
                          },
                          onLongPressEnd: (details) {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setHeadMovement(Movement.stop);
                          },
                          child: IconButton(
                              onPressed: () {
                                print('HEAD ANTI');
                              },
                              icon: Icon(
                                Icons.arrow_left,
                                size: 50,
                              )),
                        ),
                        Text("Head Movement", style: TextStyle(fontSize: 25)),
                        GestureDetector(
                          onLongPress: () {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setHeadMovement(Movement.clockwise);
                          },
                          onLongPressEnd: (details) {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setHeadMovement(Movement.stop);
                          },
                          child: IconButton(
                              onPressed: () {
                                print('HEAD ANTI');
                              },
                              icon: Icon(
                                Icons.arrow_right,
                                size: 50,
                              )),
                        ),
                      ]),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 70,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setLeftHandMovement(Movement.anticlockwise);
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setRightHandMovement(Movement.anticlockwise);
                          },
                          onLongPressEnd: (details) {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setLeftHandMovement(Movement.stop);
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setRightHandMovement(Movement.stop);
                          },
                          child: IconButton(
                              onPressed: () {
                                print('HEAD ANTI');
                              },
                              icon: Icon(
                                Icons.arrow_upward,
                                size: 50,
                              )),
                        ),
                        Text("Both Hand Movement",
                            style: TextStyle(fontSize: 20)),
                        GestureDetector(
                          onLongPress: () {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setLeftHandMovement(Movement.clockwise);
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setRightHandMovement(Movement.clockwise);
                          },
                          onLongPressEnd: (details) {
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setLeftHandMovement(Movement.stop);
                            Provider.of<RemoteControlViewModel>(context,
                                    listen: false)
                                .setRightHandMovement(Movement.stop);
                          },
                          child: IconButton(
                              onPressed: () {
                                print('both hands');
                              },
                              icon: Icon(
                                Icons.arrow_downward,
                                size: 50,
                              )),
                        ),
                      ]),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 70,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
