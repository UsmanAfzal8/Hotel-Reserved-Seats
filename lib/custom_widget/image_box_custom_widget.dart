
import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomFileImageBox extends StatelessWidget {
  const CustomFileImageBox({
    required this.onTap,
    this.title = 'Upload Image',
    this.size = 80,
    this.file,
    this.padding,
    this.iconColor,
    Key? key,
  }) : super(key: key);
  final Uint8List? file;
  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: size,
                width: size,
                color: Theme.of(context).primaryColor,
                child: file == null
                    ? Padding(
                        padding: padding ?? EdgeInsets.zero,
                        child: FittedBox(
                          child: Icon(
                            Icons.person,
                            color: iconColor ?? Colors.white,
                          ),
                        ),
                      )
                    : CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(file!),
                                backgroundColor: Colors.red,
                              )
              ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            child: Text(title, style: const TextStyle(height: 1)),
          ),
        ],
      ),
    );
  }
}
