import 'package:flutter/material.dart';
import 'package:flutter_blog/contoller/tile-controller.dart';
import 'package:flutter_blog/model/tile_model.dart';
import 'package:get/get.dart';

class ListGridView extends StatelessWidget {
  final TileModel tile;
  final int index;
  ListGridView({
    super.key,
    required this.tile,
    required this.index,
  });
  TileController controller = Get.put(TileController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.contentIndex.value = index;
        controller.selectedTile.value = controller.tiles[index].title;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF815854),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(tile.imgPath),
            fit: BoxFit.fill,
          ),
        ),
        height: 200,
        child: Obx(
          () => Container(
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: tile.title != Get.find<TileController>().selectedTile.value
                  ? Colors.black.withOpacity(0.5)
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  tile.icon,
                  const SizedBox(width: 5),
                  Text(
                    tile.title == "home" ? tile.title : "flutter ${tile.title}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
