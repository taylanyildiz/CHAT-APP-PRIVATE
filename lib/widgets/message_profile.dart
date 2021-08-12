import 'package:chat_app_ui/models/model.dart';
import 'package:flutter/material.dart';

class MessageProfile extends StatelessWidget {
  MessageProfile({
    Key? key,
    required this.onPress,
    required this.user,
    required this.lastMessage,
  }) : super(key: key);

  final Users? user;
  final String lastMessage;
  final Function(Users?) onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress.call(user),
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        height: 65.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCircleAvatar(),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildNameMessage(),
                          _buildDateTime(),
                        ],
                      ),
                    ),
                    _buildDivider()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 0.3,
      color: Colors.grey,
    );
  }

  Column _buildDateTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '16:08',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(5.0),
          child: Text(
            '1',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Expanded _buildNameMessage() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user?.name ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3.0),
          Expanded(
            child: Text(
              lastMessage,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCircleAvatar() {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        border: Border.all(width: 1.0, color: Colors.white),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          user?.name?.characters.first.toUpperCase() ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
