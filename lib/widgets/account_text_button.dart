import 'package:flutter/material.dart';

class AccountTextButton extends StatelessWidget {
  AccountTextButton({
    Key? key,
    required this.onTap,
    this.button,
    this.explain,
  }) : super(key: key);

  final Function() onTap;
  final String? explain;
  final String? button;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            explain ?? 'Dont have  an account?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              wordSpacing: 1.5,
            ),
          ),
          SizedBox(width: 15.0),
          GestureDetector(
            onTap: onTap,
            child: Text(
              button ?? 'Sign up',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
