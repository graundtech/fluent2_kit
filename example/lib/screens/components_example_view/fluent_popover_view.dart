import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentPopoverView extends StatefulWidget {
  const FluentPopoverView({super.key});

  @override
  State<FluentPopoverView> createState() => _FluentPopoverViewState();
}

class _FluentPopoverViewState extends State<FluentPopoverView> {
  var axis = Axis.vertical;

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
      body: Column(
        children: [
          FluentSectionHeader(
            title: "Popover",
          ),
          FluentSectionDescription(
            description:
                "Press each button twice to visualize the popover in both directions.",
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPopover(),
              _buildPopover(),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPopover(),
              _buildPopover(),
            ],
          )),
        ],
      ),
    );
  }
}
