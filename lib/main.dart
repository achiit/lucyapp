// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lucyapp/MVVM/view_models/remotecontrol_VM.dart';
import 'package:lucyapp/MVVM/view_models/robot_VM.dart';
import 'package:lucyapp/MVVM/views/robot_control_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RemoteControlViewModel()),
        ChangeNotifierProvider(
          create: (_) => RobotViewModel(), // Provide the RobotViewModel here
        ),
      ],
      child: MaterialApp(
        title: 'Lucy Robot App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RobotControlPage(),
      ),
    );
  }
}
