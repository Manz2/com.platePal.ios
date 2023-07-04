import 'package:flutter/material.dart';

class SmallRecipeCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const SmallRecipeCard({
    required this.image,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(image),
              ),
            ),
            title: Text(title),
            subtitle: Text(description),
          ),
        ],
      ),
    );
  }
}
