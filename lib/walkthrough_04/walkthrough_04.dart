import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

final images = [
  'lib/walkthrough_04/images/walkthrough_04.png',
  'lib/walkthrough_04/images/walkthrough_04.png',
  'lib/walkthrough_04/images/walkthrough_04.png',
  'lib/walkthrough_04/images/walkthrough_04.png',
];

final titles = [
  'Discover new place you will love',
  'Discover new place you will love',
  'Discover new place you will love',
  'Discover new place you will love',
];

final bodyText = [
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore',
];

class Walkthrough_04 extends StatefulWidget {
  @override
  _Walkthrough_04State createState() => _Walkthrough_04State();
}

class _Walkthrough_04State extends State<Walkthrough_04> {
  ValueNotifier _pageViewNotifier = ValueNotifier<int>(0);
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageViewNotifier.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _paddingLeftRight = 16;
    double _pageViewHeight = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                child: PageView.builder(
                  onPageChanged: ( index ){
                    _pageViewNotifier.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                          height: _pageViewHeight,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _paddingLeftRight, right: _paddingLeftRight, top: 48),
                          child: Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: _paddingLeftRight, right: _paddingLeftRight, top: 32),
                          child: Text(
                            bodyText[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(74, 74, 74, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: 4,
                  pageSnapping: true,
                  controller: _pageController,
                ),
              ),
            ),
            Container(
              child: Center(
                child: PageViewIndicator(
                  indicatorPadding: EdgeInsets.all(3),
                  pageIndexNotifier: _pageViewNotifier,
                  length: 4,
                  normalBuilder: (animationController, index) => Circle(
                    size: 10.0,
                    color: Color.fromRGBO(186, 186, 186, 1),
                  ),
                  highlightedBuilder: (animationController, index) => ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Circle(
                      size: 11.0,
                      color: Color.fromRGBO(155, 155, 155, 1),
                    ),
                  ),
                ),
              ),
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
