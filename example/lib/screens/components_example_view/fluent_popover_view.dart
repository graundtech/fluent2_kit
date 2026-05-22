import 'package:flutter/material.dart';
import 'package:fluent2_kit/fluent_icons.dart';
import 'package:fluent2_kit/fluent2_kit.dart';

class FluentPopoverView extends StatefulWidget {
  const FluentPopoverView({super.key});

  @override
  State<FluentPopoverView> createState() => _FluentPopoverViewState();
}

class _FluentPopoverViewState extends State<FluentPopoverView> {
  var axis = Axis.vertical;
  final controlledPopoverController = FluentPopoverController();

  Widget _buildPopover() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluentPopover(
          axis: axis,
          onOpen: () {
            setState(() {
              // Circular list
              axis = Axis.values[(axis.index + 1) % Axis.values.length];
            });
          },
          title: FluentText("Title"),
          subtitle: FluentText("Subtitle"),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: FluentText("This is the body"),
              ),
              FluentStrokeDivider(),
              Padding(
                padding: EdgeInsets.all(16),
                child: FluentText(
                  "You can place whatever you want here.",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(FluentIcons.more_horizontal_24_regular),
          ),
        ),
        FluentText("Click to open"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Popover",
          subtitle: "Components > Fluent Popover",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FluentSectionHeader(
              title: "Popover",
            ),
            FluentSectionDescription(
              description:
                  "Press each button twice to visualize the popover in both directions.",
            ),
            SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPopover(),
                  _buildPopover(),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPopover(),
                  _buildPopover(),
                ],
              ),
            ),
            FluentSectionHeader(title: "Controlled via FluentPopoverController"),
            FluentSectionDescription(
              description:
                  "Use a FluentPopoverController to show/hide the popover programmatically.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: FluentSize.size160.value),
              child: FluentPopover(
                controller: controlledPopoverController,
                title: FluentText("Controlled popover"),
                body: Padding(
                  padding: EdgeInsets.all(FluentSize.size160.value),
                  child: FluentText(
                    "Use the buttons below to hide me.",
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(FluentSize.size120.value),
                    child: FluentText("Anchor"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: FluentSize.size160.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FluentButton(
                    title: "Mostrar",
                    onPressed: controlledPopoverController.show,
                  ),
                  SizedBox(width: FluentSize.size120.value),
                  FluentButton(
                    title: "Esconder",
                    onPressed: controlledPopoverController.hide,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
