import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class ClearSearchHistoryView extends StatelessWidget {
  const ClearSearchHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Clear Search History",
          subtitle: "Components > Fluent List > Clear Search History",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(FluentSize.size240.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FluentText(
                "Search history is empty.",
                style: FluentThemeDataModel.of(context)
                    .fluentTextTheme
                    ?.body1Strong,
              ),
              SizedBox(height: FluentSize.size240.value),
              FluentButton(
                title: "Voltar",
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
