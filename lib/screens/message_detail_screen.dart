import 'package:chat_app_ui/constants/constants.dart';
import 'package:chat_app_ui/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDetailScreen extends GetView<MessageDetailController> {
  MessageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.messages.length,
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
              controller.messages[index].msg ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          );
        },
      ),
    );
  }

  Container _buildSendMessageBox() {
    return Container(
      height: 40.0,
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

  InkWell _buildSenButton() {
    return InkWell(
      onTap: () => controller.sendMessage(),
      radius: 20.0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.send,
          color: Colors.white,
          size: 20.0,
        ),
      ),
    );
  }
}
