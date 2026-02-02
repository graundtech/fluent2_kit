import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/fluent_icons.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentControlsView extends StatefulWidget {
  const FluentControlsView({super.key});

  @override
  State<FluentControlsView> createState() => _FluentControlsViewState();
}

class _FluentControlsViewState extends State<FluentControlsView> {
  bool showIcons = false;
  Option? _option = Option.option1;
  bool isCheckbox1 = false;
  bool isCheckbox2 = false;

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Controls",
          subtitle: "Components > Fluent Controls",
        ),
      ),
      body: FluentContainer(
        padding: EdgeInsets.only(top: FluentSize.size160.value),
        color: colorMode(FluentColors.neutralBackgroundCanvasRest,
            FluentDarkColors.neutralBackgroundCanvasRest),
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              FluentList.multiLine(
                separator: FluentStrokeDivider(
                  startIndent: FluentStrokeBorderIndent.strokeIndent16,
                ),
                sectionDescriptionText:
                    "A toggle is a visual switch between two mutually exclusive states — on and off.",
                sectionHeaderTitle: "Switch Toggle",
                sectionHeaderActions: showIcons
                    ? FluentSectionHeaderActions(
                        action1: Icon(
                          FluentIcons.circle_20_regular,
                          color: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground2Rest,
                          ),
                        ),
                        action2: Icon(
                          FluentIcons.circle_20_regular,
                          color: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground2Rest,
                          ),
                        ),
                      )
                    : null,
                listItems: [
                  FluentListItemMultiLine(
                    text: "Show Icons",
                    trailing: FluentSwitchToggle(
                      value: showIcons,
                      onChanged: (value) => setState(() {
                        showIcons = value;
                      }),
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Disabled Radio",
                    trailing: FluentSwitchToggle(
                      value: true,
                      onChanged: null,
                    ),
                  ),
                ],
              ),
              FluentList.multiLine(
                separator: FluentStrokeDivider(
                  startIndent: FluentStrokeBorderIndent.strokeIndent16,
                ),
                sectionDescriptionText:
                    "Radio buttons allow to select one option from a set of mutually exclusive choices.",
                sectionHeaderTitle: "Radio Button",
                sectionHeaderActions: showIcons
                    ? FluentSectionHeaderActions(
                        action1: Icon(
                          FluentIcons.circle_20_regular,
                          color: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground2Rest,
                          ),
                        ),
                        action2: Icon(
                          FluentIcons.circle_20_regular,
                          color: colorMode(
                            FluentColors.neutralForeground2Rest,
                            FluentDarkColors.neutralForeground2Rest,
                          ),
                        ),
                      )
                    : null,
                listItems: [
                  FluentListItemMultiLine(
                    text: "Option 1",
                    onTap: isCheckbox1
                        ? null
                        : () => setState(() {
                              _option = Option.option1;
                            }),
                    leading: FluentRadioButton<Option>(
                      value: Option.option1,
                      groupValue: _option,
                      onChanged: isCheckbox1 ? null : (value) {},
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Option 2",
                    onTap: isCheckbox1
                        ? null
                        : () => setState(() {
                              _option = Option.option2;
                            }),
                    leading: FluentRadioButton<Option>(
                      value: Option.option2,
                      groupValue: _option,
                      onChanged: isCheckbox1 ? null : (value) {},
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Option 3",
                    onTap: isCheckbox1
                        ? null
                        : () => setState(() {
                              _option = Option.option3;
                            }),
                    leading: FluentRadioButton<Option>(
                      value: Option.option3,
                      groupValue: _option,
                      onChanged: isCheckbox1 ? null : (value) {},
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Option 4",
                    onTap: isCheckbox1
                        ? null
                        : () => setState(() {
                              _option = Option.option4;
                            }),
                    leading: FluentRadioButton<Option>(
                      value: Option.option4,
                      groupValue: _option,
                      onChanged: isCheckbox1 ? null : (value) {},
                    ),
                  ),
                ],
              ),
              FluentList.multiLine(
                sectionHeaderTitle: "Fluent Checkbox",
                listItems: [
                  FluentListItemMultiLine(
                    text: "Disable Radio Buttons Above",
                    subtext:
                        "If you check here, the radio buttons above will be disabled.",
                    leading: FluentCheckbox(
                      value: isCheckbox1,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            isCheckbox1 = value;
                          });
                        }
                      },
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Second Checkbox",
                    subtext: "I am the item 2 and that's my subtext.",
                    leading: FluentCheckbox(
                      value: isCheckbox2,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            isCheckbox2 = value;
                          });
                        }
                      },
                    ),
                  ),
                  FluentListItemMultiLine(
                    text: "Disabled Checkbox",
                    subtext: "I am a disabled checkbox.",
                    leading: FluentCheckbox(
                      value: true,
                      onChanged: null,
                    ),
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}

enum Option { option1, option2, option3, option4 }
