import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:plate_pal/config.dart';
import 'package:plate_pal/screens/erstellen/erstellen_view.dart';

class ErstellenAttachments extends StatelessWidget {
  final List<String> attachments;
  final bool isEdit;
  final ErstellenController controller;
  final double sidePadding;

  const ErstellenAttachments({
    super.key,
    required this.attachments,
    required this.isEdit,
    required this.controller,
    required this.sidePadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sidePadding, 10, sidePadding, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (String attachment in attachments)
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: GestureDetector(
                    onTap: () => isEdit
                        ? controller.removeAttachmentlocal(attachment)
                        : controller.removeAttachmentRemote(attachment),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: attachment,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentScheme.getScheme().error,
                            ),
                          ),
                        ),
                        Align(
                          child: Icon(
                            Icons.delete_forever,
                            size: 30,
                            color: currentScheme.getScheme().onError,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
