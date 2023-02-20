import 'package:flutter/material.dart';
import 'package:flutter_blog/contoller/api-controller.dart';
import 'package:flutter_blog/model/content.dart';
import 'package:flutter_blog/model/tile_model.dart';
import 'package:get/get.dart';

class TileController extends GetxController {
  var tiles = <TileModel>[].obs;
  RxString selectedTile = "".obs;
  RxInt contentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tiles.assignAll([
      TileModel(
        icon: const Icon(Icons.home),
        title: "home",
        id: 0,
        imgPath: "assets/image/home.png",
      ),
      TileModel(
        id: 1,
        icon: const Icon(Icons.widgets_rounded),
        title: "widget",
        imgPath: "assets/image/widget.png",
      ),
      TileModel(
        id: 2,
        icon: const Icon(Icons.manage_accounts),
        title: "state",
        imgPath: "assets/image/state.png",
      ),
      TileModel(
        id: 3,
        icon: const Icon(Icons.developer_board_rounded),
        title: "package",
        imgPath: "assets/image/package.png",
      ),
    ]);
    selectedTile = tiles[0].title.obs;
  }

  Future<List<Post>> apiService(String path) async {
    var result = await ApiController.apiToJson(path);
    return result;
  }
}

//tile model에 post type을 삽입 => json file들을 모두 가져오게 하고 getx 를 통해 변화를 감지..?
