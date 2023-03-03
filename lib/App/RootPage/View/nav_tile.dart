
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:flutter/material.dart';

import '../../../Common/Constant/AppConfig.dart';

class NavBarTile extends StatefulWidget {
  final Color color;
  final bool isSelected;
  final String title;
  final Widget icon;
  final VoidCallback callback;
  const NavBarTile(
      {Key? key,
      required this.color,
      required this.callback,
      required this.isSelected,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  _NavBarTileState createState() => _NavBarTileState();
}

class _NavBarTileState extends State<NavBarTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: () {
          widget.callback();
        },
        child: Container(
          color: Colors.transparent,
          height: 75,
          width: AppConfig(context).width /4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              if (widget.title.isNotEmpty)
                const SizedBox(
                  height: 7,
                ),
              if (widget.title.isNotEmpty)
                CustomText(
                    title: widget.title,
                    color: widget.isSelected
                        ? widget.color
                        : const Color(0xFF999B9F),
                    size: 8),
            ],
          ),
        ),
      ),
    );
  }
}
