import '/constants/constants.dart';
import '/models/model.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  MessageBox({
    Key? key,
    required this.user,
    required this.index,
    this.isMe = false,
  }) : super(key: key);
  final Users user;
  final bool isMe;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe ? CustomColors.circleColor : CustomColors.optionsLight,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              user.messages[index].msg!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
