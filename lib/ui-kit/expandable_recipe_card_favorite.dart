import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plate_pal/service/backend_service.dart';
import 'package:plate_pal/screens/favoriten/favorite_view.dart';
import '../config.dart';

class ExpandableRecipeCardFavorite extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String id;
  final FavoriteController controller;

  const ExpandableRecipeCardFavorite({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<ExpandableRecipeCardFavorite> {
  bool isExpanded = false;
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
              onTap: () async {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: isExpanded
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  : Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                        leading: SizedBox(
                          width: 70,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: currentFontSize.toDouble(),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: currentFontSize <= 22
                            ? Text(widget.description)
                            : null,
                        trailing: IconButton(
                          iconSize: 30,
                          onPressed: () async {
                            BackendService().removeFavorites(
                                FirebaseAuth.instance.currentUser!.uid,
                                widget.id);
                            widget.controller.getFavorites();
                          },
                          icon: const Icon(Icons.star),
                          color: (isFavorite)
                              ? currentScheme.getScheme().primary
                              : currentScheme.getScheme().onSurfaceVariant,
                        ),
                      ),
                    )),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: currentFontSize.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.description),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        iconSize: 30,
                        onPressed: () async {
                          BackendService().removeFavorites(
                              FirebaseAuth.instance.currentUser!.uid,
                              widget.id);
                          widget.controller.getFavorites();
                        },
                        icon: const Icon(Icons.star),
                        color: (isFavorite)
                            ? currentScheme.getScheme().primary
                            : currentScheme.getScheme().onSurfaceVariant,
                      ),
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          widget.controller.navigateDetail(context, widget.id);
                        },
                        icon: const Icon(Icons.info),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
