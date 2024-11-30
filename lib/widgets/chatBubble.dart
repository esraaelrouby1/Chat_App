import 'package:chat/const.dart';
import 'package:chat/model/message.dart';
import 'package:flutter/material.dart';

class chatBubble extends StatelessWidget {
  const chatBubble({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
          color: Color.fromARGB(255, 102, 34, 116),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class chatBubbleForFriend extends StatelessWidget {
  const chatBubbleForFriend({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 32),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
            bottomLeft: Radius.circular(28),
          ),
          color: Color.fromARGB(255, 204, 139, 216),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
