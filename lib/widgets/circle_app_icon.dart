import 'dart:developer';

import 'package:flutter/material.dart';

class CircleAppIcon extends StatefulWidget {
  CircleAppIcon({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.iconSize,
    this.animation = false,
    this.onComplete,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? margin;
  final double? iconSize;
  final bool animation;
  final Function(bool)? onComplete;

  @override
  _CircleAppIconState createState() => _CircleAppIconState();
}

class _CircleAppIconState extends State<CircleAppIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerEntry;
  late Animation entryAnim;

  @override
  void initState() {
    if (widget.animation) {
      controllerEntry = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      )
        ..forward()
        ..addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            await Future.delayed(Duration(milliseconds: 400));
            widget.onComplete!.call(true);
          }
        });
      entryAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controllerEntry,
          curve: Curves.bounceOut,
        ),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.animation) controllerEntry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animation
        ? AnimatedBuilder(
            animation: controllerEntry,
            builder: (context, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(entryAnim.value),
              child: _buildCircleIcon(),
            ),
          )
        : _buildCircleIcon();
    ;
  }

  Widget _buildCircleIcon() {
    return Hero(
      tag: 'msgSplash',
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green.withOpacity(.5),
        ),
        child: Container(
          width: widget.width ?? 200.0,
          height: widget.height ?? 200.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.green.withOpacity(.5),
                Colors.green,
              ],
              stops: [0.0, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.mail_outline,
              color: Colors.white,
              size: widget.iconSize ?? 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
