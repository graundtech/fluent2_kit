import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class RProgressBarPage extends StatefulWidget {
  const RProgressBarPage({super.key});

  @override
  State<RProgressBarPage> createState() => _RProgressBarPageState();
}

class _RProgressBarPageState extends State<RProgressBarPage> {
  bool isUpdating = false;
  DateTime now = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (!isUpdating) updateDate();
    });
  }

  Future updateDate() async {
    bool canceled = false;

    setState(() {
      isUpdating = true;
    });
    final newDateTime = await fetchNewDateTime();
    if (!canceled && mounted) {
      setState(() {
        now = newDateTime;
        isUpdating = false;
      });
    }
  }

  Future<DateTime> fetchNewDateTime() async {
    await Future.delayed(Duration(seconds: 2));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.neutral,
        title: NavLeftSubtitle(
          title: "ProgressBar",
          subtitle: "Railson > ProgressBar",
        ),
      ),
      body: Column(
        children: [
          if (isUpdating)
            FluentProgressBar(
              value: null,
            ),
          Expanded(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("👉ProgressBar👈"),
                ),
                // FluentActivityIndicator(value: null,),
                Text("Agora $now"),
                FluentButton(
                  onPressed: isUpdating ? null : updateDate,
                  title: "Atualizar data",
                ),
                FluentProgressBar(value: .1),

                SizedBox(height: 10),

                FluentProgressBar(value: .4),

                SizedBox(height: 10),

                FluentProgressBar(value: .8),

                SizedBox(height: 10),

                FluentProgressBar(value: 1),

                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
