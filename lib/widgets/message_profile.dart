import 'package:chat_app_ui/models/model.dart';
import 'package:flutter/material.dart';

class MessageProfile extends StatelessWidget {
  MessageProfile({
    Key? key,
    required this.onPress,
    required this.user,
    this.isMe = false,
  }) : super(key: key);

  final Users? user;
  final Function(Users?) onPress;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress.call(user),
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCircleAvatar(),
            SizedBox(width: 20.0),
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
                          // _buildDateTime(),
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
            child: isMe || user!.messages.isEmpty
                ? Text(
                    user!.messages.isNotEmpty ? user!.messages.last.msg! : '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.done_all,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: Text(
                          user!.messages.isNotEmpty
                              ? user!.messages.last.msg ?? ''
                              : '',
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
          ),
        ],
      ),
    );
  }

  Container _buildCircleAvatar() {
    return Container(
      height: 55.0,
      width: 55.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        border: Border.all(width: 1.0, color: Colors.white),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          user!.name!.characters.first,
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
