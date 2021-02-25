import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';
import 'package:pangration_score/ui/Events/LiveEvents/LiveEventCell.dart';

class LiveEventsScreen extends StatelessWidget {
  final pageController = PageController(
    initialPage: 0
  );
  final _currentPageNotifier = ValueNotifier<int>(4);
  double currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    UserInstanceController userInstanceController = UserInstanceController();
    pageController.addListener(() {
      currentPage = pageController.page;
    });
    return Scaffold(
      appBar: AppBar(
          title: Text("Events"),
          backgroundColor: Colors.blue
      ),
      drawer: Drawer(
        child: ListView(
          children: userInstanceController.showAdminButtons(context),
        ),
      ),
      body:
          Container(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child:  ArrowPageIndicator(
              iconPadding: EdgeInsets.symmetric(horizontal: 12.0),
              iconColor: Colors.white,
              iconSize: 50.0,
              isInside: false,
              pageController: pageController, currentPageNotifier: _currentPageNotifier, itemCount: 3,
              child:  PageView(
                  controller: pageController,
                  children: [
                    LiveEventCell(),
                    LiveEventCell()
                  ]
              ),
            )
          )

    );
  }


}