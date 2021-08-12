import '/models/model.dart';
import '/routers/routers.dart';
import '/widgets/widgets.dart';
import '/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildChatHeader(),
          _buildListMessages(),
        ],
      ),
    );
  }

  Widget _buildListMessages() {
    return GetBuilder<UserController>(
      builder: (userController) {
        return GetBuilder<MessageListController>(
          builder: (listController) => Expanded(
            child: Scrollbar(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: listController.scrollController,
                itemCount: 4 + userController.other.length,
                addSemanticIndexes: false,
                addRepaintBoundaries: true,
                itemBuilder: (context, index) {
                  if (index == 0) return _buildSearcBox(listController);
                  if (index == 1) return _buildGroupButton();
                  if (index == 2) return _buildDivider();
                  if (index == 3) return _buildArchiveButton();
                  return _buildProfileMessageBox(userController, index);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileMessageBox(UserController userController, int index) {
    return GetBuilder<MessageScreenController>(
      builder: (messageScreenController) => MessageProfile(
        user: userController.other[index - 4],
        onPress: (user) => Get.toNamed(
          Routers.MSG_DETAIL,
          arguments: user,
        ),
        lastMessage: messageScreenController.getLastMessage(
              userController.other[index - 4],
            ) ??
            '',
      ),
    );
  }

  InkWell _buildArchiveButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60.0,
        width: Get.width,
        padding: EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
        child: Row(
          children: [
            Icon(
              Icons.inventory_2,
              color: Colors.grey,
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1),
                  Text(
                    'Archives',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 2),
                  _buildDivider(),
                ],
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
      leading: TextButton(
        onPressed: () {},
        child: Text(
          'Edit',
          style: TextStyle(
            fontSize: 18.0,
            wordSpacing: 2.0,
          ),
        ),
      ),
      centerTitle: true,
      title: GetBuilder<MessageListController>(
        builder: (listController) {
          return Opacity(
            opacity: 1 - listController.getOpacity(20),
            child: Text(
              'Chat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.edit),
          label: Text(''),
        ),
      ],
    );
  }

  Widget _buildChatHeader() {
    return GetBuilder<MessageScreenController>(
      init: Get.put(MessageScreenController()),
      builder: (controller) => GetBuilder<MessageListController>(
        builder: (listController) => AnimatedBuilder(
          animation: listController.scrollController,
          builder: (context, child) {
            final scale = listController.getPosition(40.0, 6, 20);
            return Transform.translate(
              offset: Offset(0.0, -100 * (1 - scale)),
              child: SizedBox(
                height: 50.0 * scale,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    'Chats',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearcBox(listController) {
    return AnimatedBuilder(
      animation: listController.scrollController,
      builder: (context, child) {
        final scale = listController.getPosition(30.0, 0, 20);
        return Opacity(
          opacity: scale,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              height: (40.0 * scale),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0 * scale,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 18.0,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade700,
                  contentPadding: EdgeInsets.only(top: 5.0),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroupButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Message List',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'New Group',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() => Container(
        height: .1,
        color: Colors.grey.shade500,
      );
}
