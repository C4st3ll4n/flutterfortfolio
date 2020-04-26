import 'package:flutter/material.dart';

import 'HomeAppBar.dart';
import 'HomeBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: HomeBody(),
    );
  }
}
