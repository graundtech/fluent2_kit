import 'package:example/screens/dev_brunno/progress.dart';
import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class BHomeView extends StatelessWidget {
  const BHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluentNavBar(
        themeColorVariation: FluentThemeColorVariation.brand,
        title: NavCenterSubtitle(title: "Home Page", subtitle: "for brunno"),
      ),
      drawer: FluentLeftNav(
          headerAvatar: FluentAvatar(
              size: FluentAvatarSize.size32,
              child: Container(
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  height: double.maxFinite,
                  color: FluentColors.of(context)?.brandBackgroundDisabledRest,
                  child: FluentText(
                    "KM",
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.caption1
                        ?.fluentCopyWith(
                            fluentColor: FluentColors.of(context)
                                ?.brandForeground1Pressed),
                  ))),
          header: Column(
            children: [
              FluentListItemMultiLine(
                leading: FluentAvatar(
                    child: Image.network(
                  "https://images.pexels.com/photos/15261263/pexels-photo-15261263/free-photo-of-olho-crescimento-aumento-olhando.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                )),
                text: "Krystal McKinney",
                subtext: "k.mckinny@schooloffineart.com",
                additionalContent: FluentText("Add or switch accounts",
                    style: FluentThemeDataModel.of(context)
                        .fluentTextTheme
                        ?.body1
                        ?.fluentCopyWith(fluentColor: Colors.lightBlueAccent)),
              )
            ],
          ),
          body: Column(
            children: [
              FluentListItemOneLine(
                text: "Tagged",
                leading: Icon(Icons.sticky_note_2_outlined),
              ),
              FluentListItemOneLine(
                text: "Starred",
                leading: Icon(Icons.star_border_outlined),
              ),
              FluentListItemOneLine(
                text: "Liked",
                leading: Icon(Icons.thumb_up_alt_outlined),
              ),
              FluentListItemOneLine(
                text: "Reposted",
                leading: Icon(Icons.copy),
              ),
              FluentListItemOneLine(
                text: "Watched",
                leading: Icon(Icons.remove_red_eye_outlined),
              ),
              FluentListItemOneLine(
                text: "Uploads",
                leading: Icon(Icons.view_agenda_outlined),
              ),
            ],
          )),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FluentButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProgressView();
                },
              ));
            },
            title: 'ir para tela progresso',
          ),
        ),
      ),
    );
  }
}
