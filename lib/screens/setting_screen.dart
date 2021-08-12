import 'package:chat_app_ui/constants/constants.dart';
import 'package:chat_app_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _buildProfileAvatar(),
            _buildfirstContain(),
            _buildSecondContain(),
            _buildThirdContain(),
            _buildFromWho()
          ],
        ),
      ),
    );
  }

  Container _buildFromWho() {
    return Container(
      margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'from',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Taylan YILDIZ',
              style: TextStyle(
                color: Colors.grey,
              ),
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
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout),
        )
      ],
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
          )
        ],
      ),
    );
  }

  Widget _buildfirstContain() {
    return SettingsBox(
      onTap: (index) {},
      items: [
        SettingBoxItem(
          icon: Icon(
            Icons.star,
            color: Colors.white,
          ),
          text: 'Star of message',
          backgroundColor: Colors.yellow,
        ),
        SettingBoxItem(
          icon: Icon(
            Icons.computer,
            color: Colors.white,
          ),
          text: 'Star of message',
          backgroundColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildSecondContain() {
    return SettingsBox(
      onTap: (index) {},
      items: [
        SettingBoxItem(
          icon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          text: 'Account',
          backgroundColor: Colors.blue,
        ),
        SettingBoxItem(
          icon: Icon(
            Icons.message,
            color: Colors.white,
          ),
          text: 'Messages',
          backgroundColor: Colors.lightGreenAccent,
        ),
        SettingBoxItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          text: 'Notifications',
          backgroundColor: Colors.red,
        ),
        SettingBoxItem(
          icon: Icon(
            Icons.swap_vert,
            color: Colors.white,
          ),
          text: 'Storage and Data',
          backgroundColor: Colors.greenAccent,
        )
      ],
    );
  }

  Widget _buildThirdContain() {
    return SettingsBox(
      onTap: (index) {},
      items: [
        SettingBoxItem(
          icon: Icon(
            Icons.help,
            color: Colors.white,
          ),
          text: 'Help',
          backgroundColor: Colors.blue,
        ),
        SettingBoxItem(
          icon: Icon(
            FontAwesomeIcons.solidHeart,
            color: Colors.red,
          ),
          text: 'Recommend to Your Friends',
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
