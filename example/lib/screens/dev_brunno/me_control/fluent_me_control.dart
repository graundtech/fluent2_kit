import 'package:flutter/material.dart';
import 'package:idc_fluent2_ui/idc_fluent2_ui.dart';

class FluentMeControl extends StatelessWidget {
  // final FluentMeControlController controller = FluentMeControlController();
  FluentMeControl({super.key, this.headerText});

  final String? headerText;

  @override
  Widget build(BuildContext context) {
    return FluentSheet.bottom(
      half: true,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: FluentSize.size100.value),
        child: Column(
          children: [
            // SizedBox(
            // height: FluentSize.size520.value,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: FluentSize.size160.value,
            //         right: FluentSize.size160.value,
            //         bottom: FluentSize.size80.value),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.end,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Container(
            //           // alignment: Alignment.centerLeft,
            //           child: Text("GRBTEC programmers"),
            //         ),
            //         Container(
            //           // width: 210,
            //           // height: 25,
            //           // alignment: Alignment.centerRight,
            //             child: Text("Sign Out",
            //                 style: TextStyle(color: Colors.blue.shade400))),
            //       ],
            //     ),
            //   ),
            // ),
            FluentList.multiLine(
              sectionHeaderTitle: 'Qualquer coisa',
              sectionHeaderActions: FluentSectionHeaderActions(
                  action1: Icon(Icons.access_alarm_rounded),
                  action2: Icon(Icons.account_circle)),
              listItems: [
                FluentListItemMultiLine(
                  text: "John Doe",
                  subtext: "john.doe@gbtdev.team.com",
                  leading: FluentAvatar(
                      size: FluentAvatarSize.size128,
                      child: Image.network(
                        'https://images.pexels.com/photos/1462980/pexels-photo-1462980.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )),
                ),
                FluentListItemMultiLine(
                  text: "Jane Doe",
                  subtext: "jane.doe@gbtdev.team.com",
                  leading: FluentAvatar(
                      size: FluentAvatarSize.size128,
                      child: Image.network(
                        'https://images.pexels.com/photos/2682452/pexels-photo-2682452.jpeg?auto=compress&cs=tinysrgb&w=800',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )),
                ),
                FluentListItemMultiLine(
                  text: "Manoel Gomes",
                  subtext: "Manoel.Gomes@gbtdev.team.com",
                  leading: FluentAvatar(
                      size: FluentAvatarSize.size128,
                      child: Image.network(
                        'https://yt3.googleusercontent.com/fqVEkuSr9CdD3yi8gDkZYebDE_d5UIuvtb-bvuja_xPQSPu6GSS7ha4c2rcJPNQIvXe6FUqOJvU=s900-c-k-c0x00ffffff-no-rj',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )),
                ),
                FluentListItemMultiLine(
                  text: "Louro José",
                  subtext: "Louro.jose@gbtdev.team.com",
                  leading: FluentAvatar(
                      size: FluentAvatarSize.size128,
                      child: Image.network(
                        'https://s2-gshow.glbimg.com/uDV_kONsqqza9_g91uAS3DTCM58=/336x191/top/smart/https://s2.glbimg.com/7LcY0f0rbxY___uIOLYHjUZaWEs=/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2020/f/P/OBwzbAQZqDoPYEZ0ainQ/whatsapp-image-2020-11-02-at-14.59.20-1-.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
