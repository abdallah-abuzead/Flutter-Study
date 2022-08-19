import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_test/facebook/post_card.dart';

class UserProfile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Column(
              children: [
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/my_cover_image.jpeg'),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100.0,
                        child: Container(
                          height: 190.0,
                          width: 190.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/my_profile_image.jpeg'),
                              ),
                              border: Border.all(color: Colors.white, width: 6.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 130.0,
                  child: Text('Abdallah Abuzead', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
                ),
                SizedBox(height: 12.0),
                Container(
                  child: Text(
                    'Software Engineer building Mobile apps using Flutter, and Web apps using Laravel.',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person, color: Colors.black),
                              SizedBox(width: 5),
                              Text('Friends', style: TextStyle(fontSize: 15, color: Colors.black)),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade200,
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.offline_bolt),
                              SizedBox(width: 5),
                              Text('Message', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 8)),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _showMoreOption(context);
                        },
                        child: Icon(Icons.more_horiz, color: Colors.black),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade200,
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(color: Colors.grey),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.business_center, size: 30),
                        title: Wrap(
                          children: [
                            Text('Founder and CEO at ', style: TextStyle(fontSize: 16.0)),
                            Text('SignBox', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.business_center, size: 30),
                        title: Wrap(
                          children: [
                            Text('Works at ', style: TextStyle(fontSize: 16.0)),
                            Text('SignBox', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.school, size: 30),
                        title: Wrap(
                          children: [
                            Text('Studied Computer Science at ', style: TextStyle(fontSize: 16.0)),
                            Text('Abc University', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.house, size: 30),
                        title: Wrap(
                          children: [
                            Text('Lives in ', style: TextStyle(fontSize: 16.0)),
                            Text('Pakistan', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.location_on, size: 30),
                        title: Wrap(
                          children: [
                            Text('From ', style: TextStyle(fontSize: 16.0)),
                            Text('Lahore', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.favorite, size: 30),
                        title: Text('Married', style: TextStyle(fontSize: 16.0)),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.library_add_check, size: 30),
                        title: Text('Followed by 100K people', style: TextStyle(fontSize: 16.0)),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Icon(Icons.more_horiz, size: 30),
                        title: Text('See Abdallah\'s About Info', style: TextStyle(fontSize: 16.0)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //===============================================================================================
          Divider(color: Colors.grey),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Friends', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('54 mutual friends', style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    friendCard(name: 'Ahmed Hamed', image: 'images/fb_profile_pic_1.jpeg'),
                    friendCard(name: 'Omar Abuzead', image: 'images/fb_profile_pic_2.jfif'),
                    friendCard(name: 'Mostafa Senosy', image: 'images/fb_profile_pic_3.jpg'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    friendCard(name: 'Om Mayar', image: 'images/fb_profile_pic_4.jpg'),
                    friendCard(name: 'أم بسنت', image: 'images/fb_profile_pic_5.jpg'),
                    friendCard(name: 'Wessam Elshazly', image: 'images/fb_profile_pic_6.jpg'),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('See all friends', style: TextStyle(fontSize: 15, color: Colors.black)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade200,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ],
            ),
          ),
          //===================================================================================
          Divider(thickness: 12),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Posts', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ListTile(
                  leading: CircleAvatar(radius: 25, backgroundImage: AssetImage('images/fb_profile_pic_1.jpeg')),
                  title: Text('Write something to Abdallah...', style: TextStyle(color: Colors.grey.shade600)),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.create, color: Colors.purple),
                      SizedBox(width: 5),
                      Text('Write Post', style: TextStyle(color: Colors.grey.shade800)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.collections, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Share Photo', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Divider(thickness: 12),
          Container(
            height: 70,
            padding: EdgeInsets.all(16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildElevatedButton(text: 'Photos', icon: Icons.collections),
                buildElevatedButton(text: 'Life Events', icon: Icons.star),
              ],
            ),
          ),
          Divider(thickness: 12),
          postCard(
            userImage: 'images/fb_profile_pic_1.jpeg',
            username: 'Abdallah Abuzead',
            text: 'New year, new stickers. Happy National #StickerDay—let\'s see your favorites from the past year!',
            image: 'images/my_profile_image.jpeg',
          ),
          postCard(
            text: 'New year, new stickers. Happy National #StickerDay—let\'s see your favorites from the past year!',
            userImage: 'images/fb_profile_pic_3.jpg',
            username: 'Ahmed Gamal',
          ),
        ],
      ),
    );
  }

  Widget buildElevatedButton({required String text, required IconData icon}) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.black87),
            SizedBox(width: 5),
            Text(text, style: TextStyle(fontSize: 15, color: Colors.black87)),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15),
          shape: StadiumBorder(),
          primary: Colors.grey.shade300,
        ),
      ),
    );
  }

  Expanded friendCard({required String name, required String image}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: CircleBorder(),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 5, top: 5),
            child: Text(name, style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }

  _showMoreOption(cx) {
    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.feedback, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Give feedback or report this profile', style: TextStyle(fontSize: 18.0))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.block, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Block', style: TextStyle(fontSize: 18.0))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.link, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Copy link to profile', style: TextStyle(fontSize: 18.0))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 10.0),
                  Text('Search Profile', style: TextStyle(fontSize: 18.0))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
