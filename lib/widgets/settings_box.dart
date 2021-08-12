import '/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsBox extends StatelessWidget {
  SettingsBox({
    Key? key,
    required this.onTap,
    required this.items,
    this.margin,
  }) : super(key: key);

  /// Top margin default 40.0
  final double? margin;
  final Function(int) onTap;
  final List<SettingBoxItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: CustomColors.options,
        border: Border(
          top: BorderSide(width: .2, color: Colors.grey),
          bottom: BorderSide(width: .2, color: Colors.grey),
        ),
      ),
      child: Column(
        children: List.generate(
          items.length,
          (index) {
            return Column(
              children: [
                InkWell(
                  onTap: () => onTap.call(index),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: items[index].backgroundColor,
                        ),
                        child: Center(
                          child: items[index].icon,
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        items[index].text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                index != items.length - 1
                    ? Container(
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 50.0),
                        height: .1,
                        color: Colors.grey,
                      )
                    : SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }
}

class SettingBoxItem {
  SettingBoxItem({
    required this.icon,
    required this.text,
    required this.backgroundColor,
  });
  final Icon icon;
  final String text;
  final Color? backgroundColor;
}
