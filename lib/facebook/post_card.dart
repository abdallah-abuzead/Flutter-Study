import 'package:flutter/material.dart';

Widget postCard({
  required String userImage,
  required String username,
  String text = '',
  String image = '',
  bool isArabic = false,
}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(radius: 22, backgroundImage: AssetImage(userImage)),
              title: Text(username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              subtitle: Row(children: [Text('2d . '), Icon(Icons.public, size: 18, color: Colors.black54)]),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.grey.shade700, size: 25),
              ),
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
            ),
            text == ''
                ? Container()
                : Text(
                    text,
                    style: TextStyle(height: 1.5, fontSize: 15.5),
                    textAlign: isArabic ? TextAlign.end : TextAlign.start,
                  ),
          ],
        ),
      ),
      image == ''
          ? Container()
          : Container(
              height: 300,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
            ),
      Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.thumb_up, color: Colors.white, size: 14),
                      decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.favorite, color: Colors.white, size: 14),
                      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    ),
                    SizedBox(width: 5),
                    Text('270', style: TextStyle(fontSize: 13.5, color: Colors.grey.shade800)),
                  ],
                ),
                Text('98 Comments . 6 Shares', style: TextStyle(fontSize: 13.5, color: Colors.grey.shade800)),
              ],
            ),
            SizedBox(height: 5),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thumb_up_off_alt, color: Colors.grey.shade700),
                        SizedBox(width: 5),
                        Text('Like', style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline, color: Colors.grey.shade700),
                        SizedBox(width: 5),
                        Text('Comment', style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.redo, color: Colors.grey.shade700),
                        SizedBox(width: 5),
                        Text('Share', style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Divider(thickness: 12),
    ],
  );
}
