import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/providerzineo.dart';
import 'package:portfolio/src/ui/page/home/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) {
      return ThemeProvider();
    }, child: Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: value.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: ThemeData.dark().copyWith(backgroundColor: Colors.black),
          theme: ThemeData.light(),
          home: HomePage(),
        );
      },
    ));
  }
}
