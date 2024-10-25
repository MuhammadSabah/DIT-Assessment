import 'package:dit_assessment/features/battery_info/widgets/battery_info_section.dart';
import 'package:dit_assessment/features/battery_info/widgets/battery_info_trigger_button.dart';
import 'package:dit_assessment/features/battery_info/widgets/refresh_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DIT Assessment",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BatteryInfoSection(),
              BatteryInfoTriggerButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: const RefreshButton(),
    );
  }
}
