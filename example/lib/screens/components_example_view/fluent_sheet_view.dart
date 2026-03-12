import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentSheetView extends StatefulWidget {
  const FluentSheetView({super.key});

  @override
  State<FluentSheetView> createState() => _FluentSheetViewState();
}

class _FluentSheetViewState extends State<FluentSheetView> {
  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Sheet",
          subtitle: "Components > Fluent Sheet",
        ),
      ),
      body: Column(
        children: [
          FluentSectionDescription(
            description:
                "Open a sheet to enable a simple task that people can complete before returning to the parent view.",
          ),
          FluentStrokeDivider(height: FluentSize.size480.value),
          FluentSectionHeader(
            title: "Full",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Bottom Sheet",
              onPressed: () async {
                showFluentBottomSheet(
                  context: context,
                  headerTitle: Text("BottomSheet"),
                  headerLeading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FluentIcons.arrow_left_24_regular),
                  ),
                  child: Text("This is the body of the BottomSheet"),
                );
              },
            ),
          ),
          FluentSectionHeader(
            title: "Half",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
            child: FluentButton(
              title: "Open Bottom Sheet",
              onPressed: () async {
                showFluentBottomSheet(
                  context: context,
                  half: true,
                  headerTitle: Text("BottomSheet (Half)"),
                  headerLeading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FluentIcons.arrow_left_24_regular),
                  ),
                  child: Text("This is the body of the BottomSheet"),
                );
              },
            ),
          ),
          FluentSectionDescription(
            description: "Example of sheets with header and body.",
          )
        ],
      ),
    );
  }
}
