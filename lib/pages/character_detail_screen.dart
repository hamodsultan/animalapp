import 'package:animals_app/models/character.dart';
import 'package:animals_app/styleguide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final double _expandedBottomSheet = 0;
  final double _collapsedBottomSheet = -250;
  final double _fullCollapsedBottomSheet = -330;
  final Character character;
  const CharacterDetailScreen({Key key, this.character}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CharacterDetailScreenState();
  }
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  double _currentButtomSheet = -330;
  bool isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Hero(
          tag: "background-${widget.character.name}",
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: widget.character.colors,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 16),
                child: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 40,
                  color: Colors.white.withOpacity(0.9),
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 250), () {
                      setState(() {
                        _currentButtomSheet = widget._fullCollapsedBottomSheet;
                      });
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.character.name}",
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Hero(
                      tag: "name-${widget.character.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child: Text(
                          widget.character.name,
                          style: AppTheme.heading,
                        )),
                      ))),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 8, 32),
                child: Center(
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subHeading,
                  ),
                ),
              )
            ],
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
          bottom: _currentButtomSheet,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: _onTap,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    height: 80,
                    child: Text(
                      "Clips",
                      style: AppTheme.subHeading.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  _onTap() {
    setState(() {
      _currentButtomSheet = isCollapsed
          ? widget._expandedBottomSheet
          : widget._collapsedBottomSheet;
      isCollapsed = !isCollapsed;
    });
  }
}
