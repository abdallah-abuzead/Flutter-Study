import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:study_test/facebook/post_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildWritePostContainer(),
        Divider(thickness: 8),
        buildRoomsContainer(),
        Divider(thickness: 12),
        buildStatusContainer(),
        Divider(thickness: 12),
        buildPostsContainer(),
      ],
    );
  }

  Container buildPostsContainer() {
    return Container(
      child: Column(
        children: [
          postCard(
            userImage: 'images/my_profile_image.jpeg',
            username: 'Abdallah Abuzead',
            text: 'New year, new stickers. Happy National #StickerDay—let\'s see your favorites from the past year!',
            image: 'images/my_profile_image.jpeg',
          ),
          postCard(
            text: 'New year, new stickers. Happy National #StickerDay—let\'s see your favorites from the past year!',
            userImage: 'images/fb_profile_pic_3.jpg',
            username: 'Ahmed Gamal',
          ),
          postCard(
            text:
                'س/ كله بيقول اتجوز اللي عنده دين، يعني ايه بقى عنده "دين"، اعرفها ازاي دي؟!\n ج/ سؤال حلو \١- يواظب على أداء الفرائض \n٢- يجتنب فعل الكبائر \n ٣- تاركا البِدَع \n ٤- يجاهد في الصغائر \n  ٥- يردعُه قال الله وقال رسول الله \n  باقي الكماليات هي فروق شخصية أو اجتهادات مش لازم تتواجد في كل الناس، لكن الخمسة دول أساسيات منصحش انك تتنازل عن ولا واحدة فيهم.. بلاش عشان هتندم \n #الساخر_الهادف',
            userImage: 'images/fb_profile_pic_5.jpg',
            image: 'images/fb_profile_pic_6.jpg',
            username: 'Om Mayar',
            isArabic: true,
          ),
        ],
      ),
    );
  }

  Container buildStatusContainer() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      height: 224,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 8),
          buildCreateStoryCard(),
          buildStatusCard(
            statusImage: 'images/my_photo_2.jpg',
            userImage: 'images/my_profile_image.jpeg',
            username: 'Abdallah Abuzead',
          ),
          buildStatusCard(
            statusImage: 'images/fb_profile_pic_6.jpg',
            userImage: 'images/fb_profile_pic_1.jpeg',
            username: 'Ahmed Gamal',
          ),
          buildStatusCard(
            statusImage: 'images/fb_profile_pic_2.jfif',
            userImage: 'images/fb_profile_pic_4.jpg',
            username: 'Om Mayar',
          ),
          buildStatusCard(
            statusImage: 'images/fb_profile_pic_5.jpg',
            userImage: 'images/fb_profile_pic_3.jpg',
            username: 'Rayan',
          ),
          buildStatusCard(
            statusImage: 'images/my_cover_image.jpeg',
            userImage: 'images/avatar.png',
            username: 'Wessam Elshazly',
          ),
        ],
      ),
    );
  }

  Card buildCreateStoryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        children: [
          Container(width: 110, height: 200),
          Container(
            width: 110,
            height: 135,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/my_profile_image.jpeg')),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),
          Positioned(
            top: 112,
            left: 36,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Icon(Icons.add_circle, color: Colors.blue, size: 40),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 110,
              child: Center(
                child: Text(
                  'Create Story',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey.shade800),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildStatusCard({required String statusImage, required String userImage, required String username}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        children: [
          Container(
            width: 110,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage(statusImage)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding: EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800, width: 2.25),
                borderRadius: BorderRadius.circular(25),
              ),
              child: CircleAvatar(backgroundImage: AssetImage(userImage)),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 110,
              child: Text(username, style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          )
        ],
      ),
    );
  }

  Container buildRoomsContainer() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Audio and Video Rooms',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 72,
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Create Room',
                    style: TextStyle(fontSize: 16, color: Colors.lightBlueAccent.shade700),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    primary: Colors.lightBlue.shade50,
                  ),
                ),
                SizedBox(width: 15),
                buildRoomBadge(image: 'images/fb_profile_pic_1.jpeg'),
                buildRoomBadge(image: 'images/fb_profile_pic_2.jfif'),
                buildRoomBadge(image: 'images/fb_profile_pic_3.jpg'),
                buildRoomBadge(image: 'images/fb_profile_pic_4.jpg'),
                buildRoomBadge(image: 'images/fb_profile_pic_5.jpg'),
                buildRoomBadge(image: 'images/fb_profile_pic_6.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRoomBadge({required String image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Badge(
        position: BadgePosition.bottomEnd(bottom: -3, end: -3),
        badgeColor: Colors.green,
        badgeContent: Container(padding: EdgeInsets.all(5)),
        borderSide: BorderSide(color: Colors.white, width: 2),
        elevation: 0,
        child: CircleAvatar(radius: 24, backgroundImage: AssetImage(image)),
      ),
    );
  }

  Container buildWritePostContainer() {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 10),
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 10,
            leading: CircleAvatar(radius: 20, backgroundImage: AssetImage('images/my_profile_image.jpeg')),
            title: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'What\'s on your mind?',
                hintStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.75),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Divider(color: Colors.grey.shade900),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_camera_front, color: Colors.red),
                      SizedBox(width: 5),
                      Text('Live', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.collections, color: Colors.green),
                      SizedBox(width: 5),
                      Text('Photo', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_call, color: Colors.purple),
                      SizedBox(width: 5),
                      Text('Room', style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
