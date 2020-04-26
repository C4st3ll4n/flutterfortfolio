import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  Widget _option(String text, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text("$text", style: TextStyle(color: Colors.black87)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
        title: Text(
          "Pedro Henrique",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          _option("Linkedin", () {}),
          _option("GitLab", () {}),
          _option("Github", () {}),
          _option("LATTES", () {}),
        ]);
  }
}
