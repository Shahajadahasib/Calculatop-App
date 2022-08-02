import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider/theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProviders>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            //   child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: const [
            //         Flexible(
            //           child: Text('News app',
            //               style: TextStyle(fontSize: 20, letterSpacing: 0.6)),
            //         ),
            //       ]),
            // ),
            SwitchListTile(
              // tileColor: Theme.of(context).cardColor,
              value: themeState.getDarkTheme,
              onChanged: (bool state) {
                setState(
                  () {
                    themeState.setDarkTheme = state;
                  },
                );
              },

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(themeState.getDarkTheme
                      ? Icons.light_mode
                      : Icons.nightlight),
                  Text(
                    "Theme",
                    style: TextStyle(fontSize: 20),
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
