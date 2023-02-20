import 'package:flutter/material.dart';
import 'package:flutter_blog/const/color.dart';
import 'package:flutter_blog/contoller/tile-controller.dart';
import 'package:get/get.dart';

class DrawerView extends StatelessWidget {
  bool deskTopMode;
  DrawerView({
    super.key,
    required this.deskTopMode,
  });

  TileController controller = Get.put(TileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: outSideColor,
      child: Obx(
        () => ListView(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.account_circle_rounded,
                size: 30.0,
                color: bgColor,
              ),
            ),
            ...controller.tiles
                .map(
                  (tile) => renderListTile(
                    tile.title,
                    tile.icon,
                    context,
                    tile.id,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  // drawer listTile method
  Widget renderListTile(
    String title,
    Icon icon,
    BuildContext context,
    int index,
  ) {
    return ListTile(
      onTap: () {
        Get.find<TileController>().selectedTile.value = title;
        Get.find<TileController>().contentIndex.value = index;
        if (!deskTopMode) {
          Navigator.of(context).pop();
        }
      },
      selectedColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: bgColor),
      ),
      leading: icon,
      selected: title.obs == controller.selectedTile ? true : false,
    );
  }
}
