import 'dart:convert';
import 'package:assignment/constants/app_icons.dart';
import 'package:assignment/model/reels_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../service/api.dart';
import '../service/cache.dart';

class ReelController extends GetxController {


  @override
  Future<void> onInit() async {
    super.onInit();
    await getPostData();
    print('Controller initialized');
  }

  var loading=true.obs;
  List<ReelsModel> realse = [];
  Rx<ReelsModel> reelData = ReelsModel().obs;

  var topButtons = [
    {
      'iconPath': AppIcons.add,
      'buttonText': "Add Listing",
      'centerFill': false,
    },
    {
      'iconPath': AppIcons.search,
      'buttonText': "Search",
      'centerFill': false,
    },
    {
      'iconPath': AppIcons.notification,
      'buttonText': "Notification",
      'centerFill': false,
    },
    {
      'iconPath': AppIcons.electronics,
      'buttonText': "Electronics",
      'centerFill': true,
    },
    {
      'iconPath': AppIcons.applicence,
      'buttonText': "Appliances",
      'centerFill': true,
    }
  ];
  getData() async {
    await getPostData();
  }
  cacheVideos(String url, int i) async {
    FileInfo? fileInfo = await kCacheManager.getFileFromCache(url);
    if (fileInfo == null) {
      // print('downloading file ##------->$url##');
      await kCacheManager.downloadFile(url);
      // print('downloaded file ##------->$url##');
      if (i + 1 == reelData.value.posts?.length) {
        print('caching finished');
      }
    }
  }

  Future<void>  getPostData() async {
    try {
      loading.value=true;
      update();
      final res = await http.post(
        Uri.parse('${Api.baseURL}home-posts-test'),
      );
      if (res.statusCode == 200) {
        var result = jsonDecode(res.body);
        reelData.value=  ReelsModel.fromJson(result);
        for(int i=0 ;i<reelData.value.posts!.length;i++){
          cacheVideos(reelData.value.posts![i].postVideo??'', i);
        }
        loading.value=false;
        update();
      } else {}
    } catch (err) {
      loading.value=false;
      update();
      if (kDebugMode) {
        print('Something went wrong ${err}');
      }
    }
  }
}