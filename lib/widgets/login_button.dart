import 'package:chat_app_ui/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  LoginButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final double? width;
  final double? height;

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    animation = Tween<double>(begin: 1.0, end: 0.95).animate(controller);
    super.initState();
  }

  void onTap() async {
    await controller.forward();
    await controller.reverse();
    widget.onPressed.call();
  }

  void onPanStart(_) {
    controller.reverse();
  }

  onPanDown(_) {
    controller.forward();
  }

  void onPanCancel() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(animation.value),
        child: GestureDetector(
          onTap: onTap,
          onPanStart: onPanStart,
          onPanDown: onPanDown,
          onPanCancel: onPanCancel,
          child: child,
        ),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        decoration: BoxDecoration(
          gradient: CustomColors.loginButtonColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: widget.child,
      ),
    );
  }
}
