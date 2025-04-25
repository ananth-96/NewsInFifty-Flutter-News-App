import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(
        'NewsInFifty',
        style: TextStyle(
          
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
    );
  }
}