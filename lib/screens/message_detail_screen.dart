import '/constants/constants.dart';
import '/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDetailScreen extends GetView<MessageDetailController> {
  MessageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageDetailController>(
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: _buildAppBar(),
          body: Column(
            children: [
              _buildMessageList(),
              _buildSendMessageBox(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Transform.translate(
        offset: Offset(-20.0, 0.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                controller.user.name!.characters.first.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
            ),
            SizedBox(width: 20.0),
            Text(controller.user.name!),
          ],
        ),
      ),
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.call),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.video_call),
        ),
      ],
    );
  }

  Widget _buildMessageList() {
    return GetBuilder<MessageController>(
      builder: (messageController) {
        return Expanded(
          child: ListView.builder(
            itemCount: 0,
            reverse: true,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.selectionColor,
                ),
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Container _buildSendMessageBox() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 70.0,
      child: Row(
        children: [
          _buildInputBox(),
          _buildSenButton(),
        ],
      ),
    );
  }

  Expanded _buildInputBox() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: TextField(
          controller: controller.textMsgController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Message...',
            contentPadding: EdgeInsets.only(
              top: 3.0,
              left: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  _buildSenButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      margin: EdgeInsets.only(right: 10.0),
      child: Center(
        child: IconButton(
          onPressed: () => controller.sendMessage(),
          icon: Icon(
            Icons.send,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
