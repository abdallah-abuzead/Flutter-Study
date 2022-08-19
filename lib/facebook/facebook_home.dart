import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_test/facebook/home_tab.dart';

class FacebookHome extends StatelessWidget {
  const FacebookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'facebook',
            style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              height: 35,
              width: 35,
              child: Icon(Icons.search, color: Colors.grey.shade800, size: 27),
              decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
            ),
            SizedBox(width: 10),
            Badge(
              position: BadgePosition.bottomEnd(bottom: 30, end: 10),
              badgeColor: Colors.red.shade600,
              badgeContent: Text('2', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              child: Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.offline_bolt, color: Colors.grey.shade800, size: 27),
                decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
              ),
            ),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.only(bottom: 5),
            indicatorWeight: 4,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade600,
            tabs: [
              Icon(Icons.home, size: 27),
              Icon(Icons.people_outline, size: 27), //people
              Badge(
                position: BadgePosition.bottomEnd(bottom: 12, end: -8),
                badgeColor: Colors.red.shade600,
                badgeContent: Text(
                  '5',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                child: Icon(Icons.ondemand_video, size: 27),
              ),
              Icon(Icons.storefront, size: 27),
              Badge(
                position: BadgePosition.bottomEnd(bottom: 12, end: -4),
                badgeColor: Colors.red.shade600,
                badgeContent: Text(
                  '9',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                child: Icon(Icons.notifications_none, size: 27),
              ),
              Icon(Icons.menu, size: 27),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(child: HomeTab()),
            Tab(child: Center(child: Text('Hello'))),
            Tab(child: Center(child: Text('Hello'))),
            Tab(child: Center(child: Text('Hello'))),
            Tab(child: Center(child: Text('Hello'))),
            Tab(child: Center(child: Text('Hello'))),
          ],
        ),
      ),
    );
  }
}
