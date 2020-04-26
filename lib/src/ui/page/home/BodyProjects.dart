import 'package:flutter/material.dart';
import 'package:portfolio/src/shared/providerzineo.dart';
import 'package:provider/provider.dart';

class BodyProjects extends StatefulWidget {
  final bool expand;

  const BodyProjects({
    Key key,
    this.expand,
  }) : super(key: key);

  @override
  _BodyProjectsState createState() => _BodyProjectsState();
}

class _BodyProjectsState extends State<BodyProjects> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                duration: Duration(milliseconds: 750),
                opacity: widget.expand ? 1 : 0,
                child: AnimatedContainer(
                  height: !widget.expand ? 0 : 100,
                  duration: Duration(milliseconds: 450),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Selected projects",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Hover over project to see more",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          MouseRegion(
                            onEnter: (event) {},
                            onExit: (event) {},
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .change();
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    Provider.of<ThemeProvider>(context).isDark
                                        ? Colors.white
                                        : Colors.black,
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Color(0xffFF3366),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Enable dark mode",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFF3366)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (ctx, indx) {
                      return ProjectCard(posicao:indx);
                    }),
              ),
            ],
          ),
        ),
        SizedBox(
          height: !widget.expand ? 150 : 0,
        )
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final int posicao;
  ProjectCard({Key key, this.posicao}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider value, Widget child) {
        return MouseRegion(
          onEnter: (event) {
          print("Key: ${widget.posicao}");
            value.expandCard(widget.posicao);
          },
          onExit: (e) {
          print("Key: ${widget.posicao}");
            value.expandCard(widget.posicao);
          },
          child: Card(
            shadowColor: Colors.black87,
            elevation: _elevation(value),
            color: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.only(right: 45),
            child: AnimatedContainer(
              height: value.cardExpanding==widget.posicao?value.isCardExpanding ? 400 : 200:200,
              width: value.cardExpanding==widget.posicao?value.isCardExpanding ? 400 : 200:200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://i.imgur.com/jbPxR3k.png"),
                ),
              ),
              duration: Duration(milliseconds: 2000),
            ),
          ),
        );
      },
    );
  }

  double _elevation(ThemeProvider value) {
      print("ce: ${value.cardExpanding}\npos:${widget.posicao}");
    if(value.cardExpanding!=null && value.cardExpanding == widget.posicao){
      return value.isCardExpanding ? 20 : 10;
    }else{
      return 10;
    }
  }
}
