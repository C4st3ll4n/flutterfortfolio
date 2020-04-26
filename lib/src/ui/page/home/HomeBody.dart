import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/style.dart';

import 'BodyProjects.dart';
import 'HomeBodyHeader.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool animation = false;
  final controller = ScrollController();

  void toggleExpanded() {
    setState(() {
      animation = !animation;
      controller.animateTo(
          animation? 100:controller.position.maxScrollExtent ,
          duration: Duration(milliseconds: 100
          ), curve: Curves.easeInCirc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
        child: Column(
          children: <Widget>[
            BodyHeader(
              onTap: toggleExpanded,
            ),
            BodyProjects(expand: animation)
          ],
        ));
  }
}
