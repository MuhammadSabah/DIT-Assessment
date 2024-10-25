import 'package:dit_assessment/features/battery_info/providers/battery_info_provider.dart';
import 'package:dit_assessment/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatteryInfoTriggerButton extends ConsumerWidget {
  const BatteryInfoTriggerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(batteryInfoProvider.notifier).getBatteryInfo(context);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: kButtonShadowColor,
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Center(
          child: Text("Get Battery Level & Charging Status"),
        ),
      ),
    );
  }
}
