import 'package:animals_app/models/character.dart';
import 'package:animals_app/widgets/charachter_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharactersListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CharactersListWidget();
  }
}

class _CharactersListWidget extends State<CharactersListScreen> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false,
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            "تطبيق مملكة الحيوانات",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: []),
              ),
              Expanded(
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  children: [
                    for (var i = 0; i < characters.length; i++)
                      CharacterWidget(
                          character: characters[i],
                          pageController: _pageController,
                          currentPage: i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
