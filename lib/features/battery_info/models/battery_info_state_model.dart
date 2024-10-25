import 'package:flutter/material.dart';

class BatteryInfoStateModel {
  final String? batteryLevel;
  final String? batteryStatus;
  final String? batteryLevelIcon;
  final Color? batteryChargingColor;
  final String? errorMessage;

  BatteryInfoStateModel({
    this.batteryLevel,
    this.batteryStatus,
    this.batteryLevelIcon,
    this.batteryChargingColor,
    this.errorMessage,
  });

  BatteryInfoStateModel copyWith({
    String? batteryLevel,
    String? batteryStatus,
    String? batteryLevelIcon,
    String? batteryStatusIcon,
    Color? batteryChargingColor,
    String? errorMessage,
  }) {
    return BatteryInfoStateModel(
      batteryLevel: batteryLevel ?? this.batteryLevel,
      batteryStatus: batteryStatus ?? this.batteryStatus,
      batteryLevelIcon: batteryLevelIcon ?? this.batteryLevelIcon,
      batteryChargingColor: batteryChargingColor ?? this.batteryChargingColor,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
