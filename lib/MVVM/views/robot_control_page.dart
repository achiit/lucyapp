// views/robot_control_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucyapp/MVVM/view_models/robot_VM.dart';
import 'package:lucyapp/MVVM/views/remote_controlpage.dart';
import 'package:provider/provider.dart';

import 'robot_grid.dart';

class RobotControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RobotViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lucy Robot Control'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Remote Control",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              ListTile(
                title:
                    Text('Go to remote page', style: TextStyle(fontSize: 20)),
                subtitle: Text('Control the robot remotely'),
                onTap: () {
                  print('Forward');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RemoteControlPage()));
                },
              ),
              Row(
                children: [
                  Text(
                    "Modes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Expanded(child: RobotGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
