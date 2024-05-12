class ReelsModel {
  bool? status;
  String? message;
  List<Posts>? posts;

  ReelsModel({this.status, this.message, this.posts});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add( Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? postId;
  int? userId;
  int? typeId;
  int? payType;
  int? price;
  String? currency;
  int? status;
  String? website;
  int? isPromote;
  String? campDate;
  String? campTime;
  String? description;
  String? postVideo;
  String? hashtags;
  String? hashtagTitles;
  String? postType;
  String? profileImage;
  String? name;
  String? countryId;
  String? country;
  String? flag;
  String? currencyFlag;
  String? laqtaCoins;
  String? postTitle;
  String? content;
  List<Images>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  String? type;
  List<void>? survey;

  Posts(
      {this.postId,
        this.userId,
        this.typeId,
        this.payType,
        this.price,
        this.currency,
        this.status,
        this.website,
        this.isPromote,
        this.campDate,
        this.campTime,
        this.description,
        this.postVideo,
        this.hashtags,
        this.hashtagTitles,
        this.postType,
        this.profileImage,
        this.name,
        this.countryId,
        this.country,
        this.flag,
        this.currencyFlag,
        this.laqtaCoins,
        this.postTitle,
        this.content,
        this.images,
        this.likes,
        this.shares,
        this.comments,
        this.offers,
        this.type,
        this.survey});

  Posts.fromJson(Map<String, dynamic> json) {
    postId = json['post_id']??"";
    userId = json['user_id']??"";
    typeId = json['type_id']??"";
    payType = json['pay_type']??0;
    price = json['price']??0;
    currency = json['currency'].toString()??"";
    status = json['status']??0;
    website = json['website']??"";
    isPromote = json['is_promote']??0;
    campDate = json['camp_date']??"";
    campTime = json['camp_time']??"";
    description = json['description']??"";
    postVideo = json['post_video']??"";
    // hashtags = json['hashtags']??"";
    hashtagTitles = json['hashtag_titles']??"";
    // postType = json['post_type']??"";
    profileImage = json['profile_image']??"";
    name = json['name']??"";
    // countryId = json['country_id']??"";
    country = json['country']??"";
    flag = json['flag']??"";
    currencyFlag = json['currency_flag']??"";
    // laqtaCoins = json['laqta_coins']??"";
    postTitle = json['post_title']??"";

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    likes = json['likes']??0;
    shares = json['shares']??0;
    comments = json['comments']??0;
    offers = json['offers']??0;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data =  <String, dynamic>{};
    data['post_id'] = postId;
    data['user_id'] = userId;
    data['type_id'] = typeId;
    data['pay_type'] = payType;
    data['price'] = price;
    data['currency'] = currency;
    data['status'] = status;
    data['website'] = website;
    data['is_promote'] = isPromote;
    data['camp_date'] = campDate;
    data['camp_time'] = campTime;
    data['description'] = description;
    data['post_video'] = postVideo;
    data['hashtags'] = hashtags;
    data['hashtag_titles'] = hashtagTitles;
    data['post_type'] = postType;
    data['profile_image'] = profileImage;
    data['name'] = name;
    data['country_id'] = countryId;
    data['country'] = country;
    data['flag'] = flag;
    data['currency_flag'] = currencyFlag;
    data['laqta_coins'] = laqtaCoins;
    data['post_title'] = postTitle;
    data['content'] = content;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['likes'] = likes;
    data['shares'] = shares;
    data['comments'] = comments;
    data['offers'] = offers;
    data['type'] = type;
    return data;
  }
}

class Images {
  String? image;
  int? isFirstPic;

  Images({this.image, this.isFirstPic});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isFirstPic = json['is_first_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['image'] = image;
    data['is_first_pic'] = isFirstPic;
    return data;
  }
}