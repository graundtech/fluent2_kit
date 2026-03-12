import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent2ui.dart';

class RActivityIndicatorPage extends StatefulWidget {
  const RActivityIndicatorPage({super.key});

  @override
  State<RActivityIndicatorPage> createState() => _RActivityIndicatorPageState();
}

class _RActivityIndicatorPageState extends State<RActivityIndicatorPage> {
  DateTime now = DateTime.now();

  Future updateDate() {
    bool canceled = false;

    Future tryUpdateDate() async {
      final newDateTime = await fetchNewDateTime();
      if (!canceled && mounted) {
        setState(() {
          now = newDateTime;
        });
      }
    }

    final future = tryUpdateDate();

    FluentHeadsUpDisplayDialog(
      future: future,
      confirmStopMessage: "Não quer saber mais a data?",
      hud: FluentHeadsUpDisplay(
        text: "Atualizando Data...",
      ),
    ).show(context).then((_canceled) {
      if (_canceled == true) {
        canceled = true;
      }
    });

    return future;
  }

  Future<DateTime> fetchNewDateTime() async {
    await Future.delayed(Duration(seconds: 3));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.brand,
        title: NavLeftSubtitle(
          title: "Heads-up Display",
          subtitle: "Railson > Heads-up Display",
        ),
      ),
      body: FluentRefreshActivityIndicator(
        onRefresh: updateDate,
        activityIndicatorBuilder: (BuildContext context, double? value) {
          if (value == null) {
            return SizedBox.shrink();
          }
          return FluentActivityIndicator(value: value);
        },
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("👉Heads-up Display👈"),
            ),
            // FluentActivityIndicator(value: null,),
            Text("Agora $now"),
            FluentButton(
              onPressed: updateDate,
              title: "Atualizar data",
            )
          ],
        ),
      ),
    );
  }
}
