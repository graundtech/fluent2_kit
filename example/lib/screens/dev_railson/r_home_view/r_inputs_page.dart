import 'dart:async';
import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class RInputsPage extends StatefulWidget {
  const RInputsPage({super.key});

  @override
  State<RInputsPage> createState() => _RRInputsPageState();
}

class _RRInputsPageState extends State<RInputsPage> {
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
    return Scaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.neutral,
        title: NavLeftSubtitle(
          title: "Inputs",
          subtitle: "Railson > Inputs",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FluentTextField(
              controller: controller,
              label: "Label do field",
              hintText: "Dica",
              assistiveText: "assistive",
            ),
            FluentTextField(
              label: "Label do field2",
              hintText: "Dica",
              assistiveText: error ?? "assistive",
              hasError: error != null,
            ),
            FluentTextField(
              readOnly: true,
              label: "Apenas leitura",
              hintText: "Dica",
              assistiveText: "assistive",
              controller: FluentTextFieldController()
                ..textEditingController.text = "Read only",
            ),
            FluentTextField(
              label: "Senha",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
