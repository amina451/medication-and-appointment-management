import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
    
      child: Icon(Icons.delete, size: 18, color: Colors.white),
    );
  }
}
