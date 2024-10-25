import 'package:dit_assessment/features/battery_info/providers/battery_info_provider.dart';
import 'package:dit_assessment/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BatteryInfoSection extends ConsumerWidget {
  const BatteryInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryProvider = ref.watch(batteryInfoProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenSize.getWidth(context) * 0.4,
          child: Column(
            children: [
              SvgPicture.asset(
                batteryProvider.batteryLevelIcon ??
                    "assets/icons/battery_empty_icon.svg",
                width: 90,
                color: batteryProvider.batteryLevel != null
                    ? Colors.green
                    : Colors.grey,
              ),
              const Text(
                "Battery Level",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                batteryProvider.batteryLevel ?? "%",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: ScreenSize.getWidth(context) * 0.4,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/battery_charge_state_icon.svg",
                width: 90,
                color: batteryProvider.batteryChargingColor ?? Colors.grey,
              ),
              const Text(
                "Battery Status",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      batteryProvider.batteryStatus ?? "Unknown",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
