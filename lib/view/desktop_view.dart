import 'package:flutter/material.dart';
import 'package:flutter_blog/components/content_container.dart';
import 'package:flutter_blog/components/customAppBar.dart';
import 'package:flutter_blog/components/list_gridview.dart';
import 'package:flutter_blog/const/color.dart';
import 'package:flutter_blog/contoller/tile-controller.dart';
import 'package:flutter_blog/model/content.dart';
import 'package:flutter_blog/view/drawer_view.dart';
import 'package:get/get.dart';

class DeskTopView extends StatelessWidget {
  DeskTopView({super.key});
  TileController controller = Get.put(TileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar.customAppBar(),
      body: SafeArea(
        child: Row(
          children: [
            DrawerView(deskTopMode: true),
            Expanded(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        crossAxisCount: 4,
                      ),
                    ),
                    FutureBuilder<List<Post>>(
                      future:
                          controller.apiService(controller.selectedTile.value),
                      builder: (context, snapshot) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount:
                                snapshot.hasData ? snapshot.data!.length : 0,
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
            const _IntroducePart(),
          ],
        ),
      ),
    );
  }
}

// ?????? ?????? ??? ?????????
class _IntroducePart extends StatelessWidget {
  const _IntroducePart({
    Key? key,
  }) : super(key: key);
  final TextStyle ts = const TextStyle(
    color: bgColor,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: outSideColor,
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0),
      child: Column(
        children: [
          const Icon(
            Icons.favorite_border_rounded,
            color: bgColor,
          ),
          const SizedBox(height: 50.0),
          Text(
            "flutter junior Developer",
            style: ts,
          ),
          const SizedBox(height: 50.0),
          Wrap(
            children: [
              Text(
                "flutter??? ???????????? ??????????????????",
                style: ts.copyWith(fontSize: 13.0),
              ),
              const SizedBox(height: 5),
              Text(
                "blog ???????????? ?????? ??????????????? ????????? ?????? ????????? ?????? ????????? ??????????????????.",
                style: ts.copyWith(fontSize: 13.0),
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _CustomIconcontainer(
                imgpath: "assets/image/githubs.png",
              ),
              _CustomIconcontainer(
                imgpath: "assets/image/notion.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomIconcontainer extends StatelessWidget {
  final String imgpath;
  const _CustomIconcontainer({
    Key? key,
    required this.imgpath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: bgColor),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(
              imgpath,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
