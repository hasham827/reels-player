import 'package:assignment/commons/widgets/custom_round_gradient_button.dart';
import 'package:assignment/constants/app_icons.dart';
import 'package:assignment/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/reel_controller.dart';
import 'reels_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ReelController reelController = Get.put(ReelController());

  @override
  void initState() {
    // reelController.getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>reelController.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                ReelsViewer(
                  reelList: reelController.reelData.value.posts!,
                  onClickCommentIcon: (reelData) {},
                  onClickShareIcon: (reelData) {},
                  onLike: (reelData) {},
                  onUnLike: (reelData) {},
                  onClickName: (reelData) {},
                  onFollow: (reelData) {},
                  onUnFollow: (reelData) {},
                ),
                Positioned(
                  top: height(context) * 0.03,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: width(context),
                    height: 100,
                    padding: EdgeInsets.only(left: width(context) * 0.022),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(reelController.topButtons.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: RoundGradientButton(
                            buttonText:
                            reelController.topButtons[index]['buttonText'].toString(),
                            onTap: () {},
                            centerFill: reelController.topButtons[index]['centerFill'],
                            iconPath: reelController.topButtons[index]['iconPath'].toString(),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}
