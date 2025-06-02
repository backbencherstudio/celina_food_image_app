import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("Your Favorites"),
              Spacer(),

              Checkbox(value: true, onChanged: (value){}),
               Text("Select"),
            ],
          ),
                        
        ],
      ),
    );
  }
}