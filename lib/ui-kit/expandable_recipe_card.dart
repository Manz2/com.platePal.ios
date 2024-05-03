import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:plate_pal/screens/home/home_model.dart';
import 'package:plate_pal/service/backend_service.dart';
import 'package:plate_pal/service/my_app_navigation_service.dart';
import '../config.dart';

class ExpandableRecipeCard extends StatefulWidget {
  final Recipe recipe;
  final MyAppNavigationService navigationService;

  const ExpandableRecipeCard({
    required this.recipe,
    required this.navigationService,
    super.key,
  });

  @override
  MyCardState createState() => MyCardState();
}

class MyCardState extends State<ExpandableRecipeCard> {
  bool isExpanded = false;
  bool isFavorite = false;

  setExpanded(bool value) {
    setState(() {
      isExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isWide = width > 600;
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
              onTap: () async {
                widget.navigationService.routeDetails(context, widget.recipe);
              },
              child: isExpanded
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          child: widget.recipe.image != ""
                              ? CachedNetworkImage(
                                  imageUrl: widget.recipe.image,
                                  height: isWide ? 400 : 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  height: isWide ? 400 : 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: const AssetImage(
                                      "assets/images/placeholder.png"))),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                        visualDensity: VisualDensity(vertical: isWide ? 4 : 0),
                        leading: SizedBox(
                          width: isWide ? 210 : 70,
                          height: isWide ? 80 : 50,
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: widget.recipe.image != ""
                                  ? CachedNetworkImage(
                                      memCacheHeight: isWide ? 250 : 150,
                                      imageUrl: widget.recipe.image,
                                      fit: BoxFit.cover,
                                    )
                                  : const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/placeholder.png")),
                            ),
                          ),
                        ),
                        title: Text(
                          widget.recipe.title,
                          style: TextStyle(
                              fontSize: currentFontSize.toDouble(),
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: currentFontSize <= 22
                            ? Text(widget.recipe.description)
                            : null,
                      ),
                    )),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: GestureDetector(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.recipe.title,
                        style: TextStyle(
                            fontSize: currentFontSize.toDouble(),
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(widget.recipe.description),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                BackendService().removeFavorites(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    widget.recipe.id);
                                isFavorite = !isFavorite;
                              } else {
                                BackendService().addFavorites(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    widget.recipe.id,
                                    widget.recipe.creator);
                                isFavorite = !isFavorite;
                              }
                            });
                          },
                          icon: const Icon(Icons.star),
                          color: (isFavorite)
                              ? currentScheme.getScheme().primary
                              : currentScheme.getScheme().onSurfaceVariant,
                        ),
                      ]),
                    ),
                  ],
                ),
                onTap: () => setState(() {
                  widget.navigationService.routeDetails(context, widget.recipe);
                }),
              ),
            ),
        ],
      ),
    );
  }
}
