import 'package:flutter/material.dart';

class BatteryConstants {
  static const int fullBatteryThreshold = 80;
  static const int halfBatteryThreshold = 50;
  static const int lowBatteryThreshold = 20;

  static const Color chargingColor = Colors.green;
  static const Color notChargingColor = Colors.red;
  static const Color dischargingColor = Colors.red;
  static const Color fullBatteryColor = Colors.blue;

  static const String chargingState = 'Charging';
  static const String dischargingState = 'Discharging';
  static const String fullState = 'Full';
  static const String notChargingState = 'Not charging';
  static const String unknownState = 'Unknown';
}
