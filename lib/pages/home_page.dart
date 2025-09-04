import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smarthome/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List<List<dynamic>> mySmartDevices = [
    ["Smart Light", LucideIcons.lightbulb, true],
    ["Smart AC", LucideIcons.airVent, false],
    ["Smart TV", LucideIcons.tv, false],
    ["Smart Fan", LucideIcons.fan, true],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // custom app bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              // menu icon
              Icon(
                LucideIcons.circleEllipsis,
                size: 45,
                color: Colors.grey[800],
              ),
            
              // account icon
              Icon(
                LucideIcons.user,
                size: 45,
                color: Colors.grey[800],
              )
            ]),
          ),

          const SizedBox(height: 20),
          // welcome home MITCH KOKO
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Welcome Home"),
                Text("Damir", style: TextStyle(fontSize: 40)),
              ],
            ),
          ),
          // smart devices + grid

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text("Smart Devices"),
          ),

          Expanded(
            child: GridView.builder(
              itemCount: mySmartDevices.length,
              padding: const EdgeInsets.all(25),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3,
              
              ),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  icon: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            )
          )
        ]
      )
      )
     );
  }
}