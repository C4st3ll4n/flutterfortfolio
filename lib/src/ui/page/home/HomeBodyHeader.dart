
import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/style.dart';

class BodyHeader extends StatefulWidget {
  final VoidCallback onTap;

  const BodyHeader({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  _BodyHeaderState createState() => _BodyHeaderState();
}

class _BodyHeaderState extends State<BodyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 365,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Image.asset('img/oCj4C53.png', width: MediaQuery.of(context).size.width / 2,),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40), //#3340FF
                  child: Text("Creating mobile apps for fun",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: kBodyMainTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60, vertical: 2.5 //#3340FF
                  ),
                  child: Text(
                    "Every image is a story in frame. Discover my most "
                        "populas images and uncover the stories behind them.",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: widget.onTap,
              child: Text(
                "Discover my work",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              color: kBodyMainButtonColor,
            ),
          )
        ],
      ),
    );
  }
}
