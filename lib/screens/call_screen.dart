import 'package:chat_app_ui/constants/constants.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildProfileAvatar(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                'Calling Who',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 0.1,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: CustomColors.scaffold,
      leadingWidth: double.infinity,
      leading: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Calling',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: CustomColors.options,
        border: Border(
          top: BorderSide(width: .2, color: Colors.grey),
          bottom: BorderSide(width: .2, color: Colors.grey),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Center(
              child: Text(
                'T',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Taylan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              Text(
                'Upham',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(.3),
            ),
            child: Icon(
              Icons.qr_code,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(.3),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
