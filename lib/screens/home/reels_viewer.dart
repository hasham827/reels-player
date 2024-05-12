import 'package:assignment/commons/widgets/custom_round_button.dart';
import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_icons.dart';
import 'package:assignment/constants/app_sizes.dart';
import 'package:assignment/constants/app_text_styles.dart';
import 'package:assignment/model/reels_model.dart';
import 'package:assignment/screens/home/components/reels_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commons/widgets/custom_text_button.dart';

class ReelsViewer extends StatefulWidget {
  final List<Posts> reelList;
  final Function(ReelsModel reelData)? onClickCommentIcon;
  final Function(ReelsModel reelData)? onClickShareIcon;
  final Function(ReelsModel reelData)? onLike;
  final Function(ReelsModel reelData)? onUnLike;
  final Function(ReelsModel reelData)? onClickName;
  final Function(ReelsModel reelData)? onFollow;
  final Function(ReelsModel reelData)? onUnFollow;

  const ReelsViewer(
      {Key? key,
      required this.reelList,
      this.onClickCommentIcon,
      this.onClickShareIcon,
      this.onLike,
      this.onUnLike,
      this.onClickName,
      this.onFollow,
      this.onUnFollow})
      : super(key: key);

  @override
  State<ReelsViewer> createState() => _ReelsViewerState();
}

class _ReelsViewerState extends State<ReelsViewer> {
  List<Posts> myrees1 = [];
  int _currentPage = 0;
  bool readMore = false;
  var selectedDot=0;
  PageController? pageController = PageController();

  @override
  void initState() {
    myrees1 = widget.reelList;
    _initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  void _initializeControllers() async {
    setState(() {});
  }

  Future<void> _onPageChanged(int newPage) async {
    if (newPage != _currentPage) {
      _currentPage = newPage;
      selectedDot = 0;
      setState(() {

      });
      // if (_currentPage < (myrees1.length - 1)) {
      //   setState(() {
      //   });
      // }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: myrees1.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (index){
              _onPageChanged(index);
              selectedDot=0;
              setState(() {
              });
            },

            itemBuilder: (BuildContext context, int index) {
              return Stack(children: [
                /// video play here
                Positioned.fill(
                  child: CarouselSlider.builder(
                    itemCount: myrees1[index].images!.length + 1,
                    itemBuilder:
                        (BuildContext context, int indexx, int realIndex) {
                      if (indexx == 0) {
                        return VideoPlayerWidget(
                          reelUrl: myrees1[index].postVideo??'',
                        );
                      } else {
                        /// here is dynamic value
                        return
                          CachedNetworkImage(
                            imageUrl: myrees1[index].images![indexx - 1].image.toString(),
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator(
                              color: AppColors.kPrimaryColor,
                            )),
                            errorWidget: (context, url, error) =>  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.error,color: AppColors.kPrimaryColor,size: 50,),
                                const SizedBox(height: 50,),
                                Text("Unable to load image",style: urbanistMedium.copyWith(
                                  color: Colors.white,
                                  fontSize: 16
                                ),)
                              ],
                            ),
                          );
                      }
                    },
                    options: CarouselOptions(
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      viewportFraction: 1.0,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        selectedDot=index;
                        setState(() {

                        });
                      },
                    ),
                  ),
                ),

                /// bottom data  side button render here
                Positioned(
                    bottom: 10,
                    left: width(context) * 0.030,
                    right: width(context) * 0.030,
                    child: SizedBox(
                        width: width(context),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// description
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    /// product name
                                    SizedBox(
                                      height: 19,
                                      child: Center(
                                        child: Text(
                                          "${myrees1[index].postTitle!.toString().capitalizeFirst}",
                                          style: urbanistMedium.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    ///price
                                    myrees1[index].price == 0
                                        ? const SizedBox()
                                        : SizedBox(
                                            height: 34,
                                            child: Center(
                                              child: Text(
                                                "AED ${myrees1[index].price}",
                                                style:
                                                    urbanistSemiBold.copyWith(
                                                        color: const Color(
                                                            0XFFF6A826),
                                                        fontSize: 24,
                                                        overflow:
                                                            readMore == false
                                                                ? TextOverflow
                                                                    .ellipsis
                                                                : null),
                                              ),
                                            ),
                                          ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                        width: width(context) * 0.77,
                                        height: 32,
                                        child: Text(
                                          myrees1[index]
                                                  .description!
                                                  .toString()
                                                  .isNotEmpty
                                              ? "${myrees1[index].description!.toString().trim()}...${myrees1[index].hashtagTitles!}"
                                              : myrees1[index].hashtagTitles!,
                                          style: urbanistMedium.copyWith(
                                              color: AppColors.kWhiteColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              overflow: readMore == false
                                                  ? TextOverflow.ellipsis
                                                  : null),
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                        )),
                                    const SizedBox(height: 8),

                                    /// country name
                                    SizedBox(
                                      height: 25,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          /// country flag
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.amber,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/icons/flag.png"),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            myrees1[index].country.toString(),
                                            style: urbanistMedium.copyWith(
                                                color: AppColors.kWhiteColor,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                letterSpacing: 0.2,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height: height(context) *
                                            0.011),
                                    CustomTextButton(
                                      onTap: () {},
                                      buttonText: "Visit Website",
                                    ),
                                    SizedBox(
                                        height: height(context)*
                                            0.022),

                                    ///dots here
                                    SizedBox(
                                      height: 10,
                                      width: 150,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: List.generate(myrees1[index].images!.length+1, (index) {
                                          return Container(
                                            width:selectedDot== index  ? 20 : 10,
                                            height: 10,
                                            margin: const EdgeInsets.only(
                                                right: 12),
                                            decoration: BoxDecoration(
                                              borderRadius: selectedDot== index
                                                  ? BorderRadius.circular(20)
                                                  : BorderRadius.circular(
                                                      100),
                                              color: Colors.white,
                                              gradient: selectedDot== index
                                                  ? AppColors.kDotGradient
                                                  : null,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    SizedBox(
                                        height: height(context) *
                                            0.022),
                                  ],
                                ),

                                const Spacer(),

                                /// buttons
                                Column(
                                  children: [
                                    ///offer button
                                    CustomRoundButton(
                                      onTap: () {},
                                      text: "offer",
                                      iconPath: AppIcons.offer,
                                    ),
                                    SizedBox(
                                        height:
                                        height(context) *
                                                0.014),

                                    /// fav button
                                    CustomRoundButton(
                                      onTap: () {},
                                      text: myrees1[index].likes.toString(),
                                      iconPath: AppIcons.fav,
                                    ),
                                    SizedBox(
                                        height:
                                        height(context) *
                                                0.014),

                                    /// commits  button
                                    CustomRoundButton(
                                      onTap: () {},
                                      text: myrees1[index].comments.toString(),
                                      iconPath: AppIcons.commit,
                                    ),
                                    SizedBox(
                                        height:
                                        height(context) *
                                                0.014),

                                    /// share icon
                                    CustomRoundButton(
                                      onTap: () {},
                                      text: myrees1[index].shares.toString(),
                                      iconPath: AppIcons.share,
                                    ),
                                    SizedBox(
                                        height:
                                        height(context) *
                                                0.014),

                                    /// profile images
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.kPrimaryColor,
                                          image: myrees1[index].profileImage !=
                                                  null
                                              ? DecorationImage(
                                                  image: NetworkImage(myrees1[
                                                              index]
                                                          .profileImage!
                                                          .isEmpty
                                                      ? "https://www.pngitem.com/pimgs/m/272-2720656_user-profile-dummy-hd-png-download.png"
                                                      : myrees1[index]
                                                          .profileImage
                                                          .toString()),
                                                  fit: BoxFit.cover)
                                              : const DecorationImage(
                                                  image: NetworkImage(
                                                      "https://www.pngitem.com/pimgs/m/272-2720656_user-profile-dummy-hd-png-download.png"),
                                                  fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                        height:
                                        height(context) *
                                            0.06),
                                  ],
                                )
                              ],
                            )
                          ],
                        ))),
              ]);
            },
          ),
        ],
      ),
    );
  }
}
