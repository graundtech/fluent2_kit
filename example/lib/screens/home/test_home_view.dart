import 'package:example/screens/dev_leticya/l_home_view/l_home_view.dart';
import 'package:example/screens/dev_railson/r_home_view/r_home_view.dart';
import 'package:example/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

import '../dev_brunno/b_home.dart';

class TestHomeView extends StatelessWidget {
  TestHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProviderState = ThemeModeProvider.of(context);

    return FluentScaffold(
      appBar: FluentNavBar(
        title: NavLeftSubtitle(
          title: "Home",
          avatar: FluentAvatar(
            size: FluentAvatarSize.size40,
            child: Image.asset(
              'assets/images/fluent.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          subtitle: "Aqui estão alguns components Fluent",
        ),
      ),
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.cyan],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return RHomeView();
                  },
                ));
              },
              child: Text('Railson'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LHomeView();
                  },
                ));
              },
              child: Text('Leticya'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return BHomeView();
                  },
                ));
              },
              child: Text('Brunno'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return TestHomeView();
                  },
                ));
              },
              child: Text('Test Home View'),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("light"),
                FluentSwitchToggle(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    if (themeModeProviderState.themeMode == ThemeMode.dark) {
                      themeModeProviderState.themeMode = ThemeMode.light;
                    } else {
                      themeModeProviderState.themeMode = ThemeMode.dark;
                    }
                  },
                ),
                Text("dark"),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
