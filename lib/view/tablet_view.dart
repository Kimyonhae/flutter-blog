import 'package:flutter/material.dart';
import 'package:flutter_blog/components/content_container.dart';
import 'package:flutter_blog/components/customAppBar.dart';
import 'package:flutter_blog/components/list_gridview.dart';
import 'package:flutter_blog/const/color.dart';
import 'package:flutter_blog/contoller/tile-controller.dart';
import 'package:flutter_blog/model/content.dart';
import 'package:flutter_blog/view/drawer_view.dart';
import 'package:get/get.dart';

class TabletView extends StatelessWidget {
  TabletView({super.key});
  TileController controller = Get.put(TileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar.customAppBar(),
      drawer: DrawerView(deskTopMode: false),
      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: controller.tiles.length,
                  (context, index) {
                    return ListGridView(
                      tile: controller.tiles[index],
                      index: index,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 4,
                ),
              ),
              FutureBuilder<List<Post>>(
                future: controller.apiService(controller.selectedTile.value),
                builder: (context, snapshot) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: snapshot.hasData ? snapshot.data!.length : 0,
                      (context, index) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          throw Exception("error : ${snapshot.error}");
                        }
                        return ContentContainer(
                          post: snapshot.data![index],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
