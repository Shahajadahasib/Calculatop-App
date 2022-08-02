import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

import 'provider/theme_provider.dart';
import 'style/theme_data.dart';
import 'widgets/drawer.dart';

void main() {
  runApp(const DarkLightTheme());
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {
  ThemeProviders themeProvider = ThemeProviders();

  void getCurrentAppTheme() async {
    themeProvider.setDarkTheme =
        await themeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeProvider;
        }),
      ],
      child: Consumer<ThemeProviders>(
        builder: (context, value, child) {
          return MaterialApp(
            theme:
                Style.themedata(context: context, isDark: value.getDarkTheme),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: const MyHomePage(),
            routes: {
              MyHomePage.routeName: (context) => const MyHomePage(),
            },
          );
        },
      ),
    );
  }
}
