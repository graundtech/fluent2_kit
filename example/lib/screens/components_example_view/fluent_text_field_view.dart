import 'package:flutter/material.dart';
import 'package:fluent2ui/fluent_icons.dart';
import 'package:fluent2ui/fluent2ui.dart';

class FluentTextFieldView extends StatefulWidget {
  const FluentTextFieldView({super.key});

  @override
  State<FluentTextFieldView> createState() => _FluentTextFieldViewState();
}

class _FluentTextFieldViewState extends State<FluentTextFieldView> {
  final FluentTextFieldController controller = FluentTextFieldController();

  String? error;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).whenComplete(() {
      setState(() {
        error = "Fake error";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Fluent Text Field",
          subtitle: "Components > Fluent Text Field",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FluentSectionDescription(
                description:
                    "Assistive texts, icons and suffixes are optional and hidden by default in the text fields components."),
            FluentContainer(
              padding: EdgeInsets.symmetric(
                vertical: FluentSize.size240.value,
                horizontal: FluentSize.size160.value,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FluentTextField(
                    label: "Name",
                    hintText: "Timothy",
                    suffixIcon: Icon(FluentIcons.eye_24_regular),
                    controller: controller,
                  ),
                  SizedBox(height: FluentSize.size120.value),
                  FluentTextField(
                    label: "Last Name",
                    hintText: "Ballinger",
                    hasError: error != null,
                    assistiveText: error ?? "assistive",
                  ),
                  SizedBox(height: FluentSize.size120.value),
                  FluentTextField(
                    label: "Read Only Example",
                    hintText: "Read Only",
                    readOnly: true,
                  ),
                  SizedBox(height: FluentSize.size120.value),
                  FluentTextField(
                    label: "Password",
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: FluentSize.size120.value),
                  FluentTextField(
                    hintText: "Read Only",
                    readOnly: true,
                    controller: FluentTextFieldController()..textEditingController.text = "Copy me\n2\n3\n4",
                    // maxLines: 1,
                  ),
                  SizedBox(height: FluentSize.size120.value),
                  FluentTextField(
                    hintText: "No Label",
                    // maxLines: 1,
                  ),
                  SizedBox(height: FluentSize.size480.value),
                  FluentButton(
                    title: "Continue",
                    variant: FluentButtonVariant.outline,
                    isFullWidget: true,
                    onPressed: null,
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
