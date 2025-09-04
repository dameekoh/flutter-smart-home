import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final IconData icon;
  final bool powerOn;
  final void Function(bool)? onChanged;

  const SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.icon,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 65,
              color: powerOn ? Colors.white : Colors.black,
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      smartDeviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: powerOn ? Colors.white : Colors.black,
                      )
                      ),
                  )
                  ),
                Transform.rotate(
                  angle: -3.14159 / 2,
                  child: CupertinoSwitch(
                    value: powerOn, 
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}