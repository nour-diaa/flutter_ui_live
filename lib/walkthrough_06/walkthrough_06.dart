import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

final titles = [
  'Discover new place you will love',
  'Discover new place you will love',
  'Discover new place you will love',
  'Discover new place you will love',
];

final bodyText = [
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
];

final images = [
  'lib/walkthrough_06/images/walkthought_001.png',
  'lib/walkthrough_06/images/walkthought_001.png',
  'lib/walkthrough_06/images/walkthought_001.png',
  'lib/walkthrough_06/images/walkthought_001.png',
];

class Walkthrough_06 extends StatefulWidget {
  @override
  _Walkthrough_06State createState() => _Walkthrough_06State();
}

class _Walkthrough_06State extends State<Walkthrough_06> {
  PageController _pageViewController;
  ValueNotifier _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(
      initialPage: _pageIndexNotifier.value,
    );
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _pageViewHeight = MediaQuery.of(context).size.height * 0.70;
    double _imageSiz = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                  onPressed: () {
                    print('Tapped Skip');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )),
            ),
            Container(
              height: _pageViewHeight,
              child: PageView.builder(
                  controller: _pageViewController,
                  itemCount: 4,
                  onPageChanged: ( index ){
                    _pageIndexNotifier.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: _imageSiz,
                          width: _imageSiz,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(
                                images[index],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 48, bottom: 32),
                          child: Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Text(
                            bodyText[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: PageViewIndicator(
                  indicatorPadding: EdgeInsets.all(3),
                  pageIndexNotifier: _pageIndexNotifier,
                  length: 4,
                  normalBuilder: (animationController, index) => Circle(
                    size: 10.0,
                    color: Colors.grey.shade300,
                  ),
                  highlightedBuilder: (animationController, index) => ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Circle(
                      size: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  color: Color.fromRGBO(74, 144, 226, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      'DISCOVER',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  onPressed: () {
                    print('Discover');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
