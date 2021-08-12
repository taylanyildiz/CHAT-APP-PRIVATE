import 'package:get/get.dart';
import '/constants/constants.dart';
import 'package:flutter/material.dart';

enum InputType { USERNAME, PASSWORD, PHONE, MAIL }

class LogInput extends StatefulWidget {
  LogInput({
    Key? key,
    TextEditingController? textController,
    required this.inputType,
    required this.onCheck,
    this.isPassword = false,
    this.border,
    this.height,
    this.width,
    this.hint,
    this.explain,
    this.maxLength,
  })  : this.textController = textController ?? TextEditingController(),
        super(key: key);

  final InputType inputType;
  final Function(bool) onCheck;
  final TextEditingController textController;
  final int? maxLength;
  final String? hint;
  final bool isPassword;
  final String? explain;
  final double? border;
  final double? width;
  final double? height;

  @override
  _LogInputState createState() => _LogInputState();
}

class _LogInputState extends State<LogInput> {
  bool isCheck = false;
  bool isEmpty = false;
  bool isValidator = true;

  @override
  void initState() {
    super.initState();
  }

  void onChanged(String? input) {
    if (input!.trim().isNotEmpty) {
      isEmpty = true;
      checkUtils(input);
    } else {
      isEmpty = false;
      isCheck = false;
      // check is  and true
      widget.onCheck.call(isCheck);
    }
    setState(() {});
  }

  checkUtils(input) {
    if (GetUtils.isUsername(input) && widget.inputType == InputType.USERNAME) {
      isCheck = true;
      widget.onCheck.call(isCheck);
    } else if (!GetUtils.isUsername(input) &&
        widget.inputType == InputType.USERNAME) {
      isCheck = false;
      widget.onCheck.call(isCheck);
    }
    if (GetUtils.isEmail(input) && widget.inputType == InputType.MAIL) {
      isCheck = true;
      widget.onCheck.call(isCheck);
    } else if (!GetUtils.isEmail(input) && widget.inputType == InputType.MAIL) {
      isCheck = false;
      widget.onCheck.call(isCheck);
    }
    if (GetUtils.isPhoneNumber(input) && widget.inputType == InputType.PHONE) {
      isCheck = true;
      widget.onCheck.call(isCheck);
    } else if (!GetUtils.isPhoneNumber(input) &&
        widget.inputType == InputType.PHONE) {
      isCheck = false;
      widget.onCheck.call(isCheck);
    }
    if (input.length >= 6 && widget.inputType == InputType.PASSWORD) {
      isCheck = true;
      widget.onCheck.call(isCheck);
    } else if (input.length < 6 && widget.inputType == InputType.PASSWORD) {
      isCheck = false;
      widget.onCheck.call(isCheck);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              widget.explain ?? 'Name',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              gradient: isEmpty ? CustomColors.loginButtonColor : null,
              color: !isEmpty ? Colors.grey : null,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              maxLength: widget.maxLength,
              style: TextStyle(
                color: Colors.grey,
              ),
              controller: widget.textController,
              obscureText: widget.isPassword,
              onChanged: onChanged,
              enableSuggestions: false,
              decoration: InputDecoration(
                  counterText: "",
                  hintText: widget.hint ?? 'Enter Your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: CustomColors.options,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: isEmpty
                      ? isCheck
                          ? _buildCheck(icon: Icons.check)
                          : _buildCheck(icon: Icons.close)
                      : SizedBox.shrink()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheck({IconData? icon}) {
    return Container(
      width: 20.0,
      margin: EdgeInsets.only(right: 20.0, top: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color(0xff212121),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 13.0,
      ),
    );
  }
}
