import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class RProgressIndicatorPage extends StatefulWidget {
  const RProgressIndicatorPage({super.key});

  @override
  State<RProgressIndicatorPage> createState() => _RProgressIndicatorPageState();
}

class _RProgressIndicatorPageState extends State<RProgressIndicatorPage> {
  DateTime lastRefresh = DateTime.now();
  bool isLoading = false;

  Future<void> onRefresh() async {
    setState(() {
      isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 3));
      if (!mounted) {
        return;
      }
      setState(() {
        lastRefresh = DateTime.now();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.brand,
        title: NavLeftSubtitle(
          title: "ProgressIndicator",
          subtitle: "Railson > ProgressIndicator",
        ),
      ),
      body: FluentRefreshActivityIndicator(
        onRefresh: onRefresh,
        activityIndicatorBuilder: (context, value) {
          return FluentActivityIndicator(value: value);
        },
        child: ListView(
          children: [
            if (isLoading) FluentActivityIndicator(value: null),
            Center(child: Text("👆👆👆👆")),
            Center(child: Text("ProgressIndicator")),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              Center(child: Text("ios: elastico")),
            if (defaultTargetPlatform == TargetPlatform.android)
              Center(child: Text("android: linear")),
            Center(child: Text("👆👆👆👆")),
            FluentStrokeDivider(
              height: 10,
            ),
            Text("last refresh ${lastRefresh}"),
            FluentActivityIndicator(value: 0.6),
            FluentActivityIndicator(value: 0.7),
            FluentActivityIndicator(value: 0.8),
            FluentActivityIndicator(value: 0.9),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 5.0),
              duration: Duration(seconds: 10),
              builder: (BuildContext context, double value, Widget? child) {
                if (value >= 5) {
                  return SizedBox.shrink();
                }
                return FluentActivityIndicator(
                  value: value > 2 ? null : value,
                );
              },
            ),
            // SizedBox(
            //   height: 1000,
            // ),
            Center(child: Text("Swipe down ")),
          ],
        ),
      ),
    );
  }
}
