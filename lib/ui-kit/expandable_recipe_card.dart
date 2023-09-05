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
    Key? key,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<ExpandableRecipeCard> {
  bool isExpanded = false;
  bool isFavorite = false;

  setExpanded(bool value) {
    setState(() {
      isExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
              onTap: () async {
                bool f = await BackendService().isFavorite(
                    FirebaseAuth.instance.currentUser!.uid, widget.recipe.id);
                setState(() {
                  isFavorite = f;
                  isExpanded = !isExpanded;
                });
              },
              child: isExpanded
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      child: widget.recipe.image != ""
                          ? CachedNetworkImage(
                              imageUrl: widget.recipe.image,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : const Image(
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/placeholder.png")))
                  : Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                        leading: SizedBox(
                          width: 70,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: widget.recipe.image != ""
                                ? CachedNetworkImage(
                                    imageUrl: widget.recipe.image,
                                    fit: BoxFit.cover,
                                  )
                                : const Image(
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/placeholder.png")),
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
                        IconButton(
                          iconSize: 30,
                          onPressed: () {
                            widget.navigationService
                                .routeDetails(context, widget.recipe);
                          },
                          icon: const Icon(Icons.info),
                        ),
                      ]),
                    ),
                  ],
                ),
                onTap: () => setState(() {
                  isExpanded = !isExpanded;
                }),
              ),
            ),
        ],
      ),
    );
  }
}
