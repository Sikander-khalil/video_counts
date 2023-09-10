class MyModel {
  String? kind;
  String? etag;
  List<Items>? items;
  String? nextPageToken;
  PageInfo? pageInfo;

  MyModel({this.kind, this.etag, this.items, this.nextPageToken, this.pageInfo});

  MyModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    etag = json['etag'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) { items!.add(new Items.fromJson(v)); });
    }
    nextPageToken = json['nextPageToken'];
    pageInfo = json['pageInfo'] != null ? new PageInfo.fromJson(json['pageInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['etag'] = this.etag;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['nextPageToken'] = this.nextPageToken;
    if (this.pageInfo != null) {
      data['pageInfo'] = this.pageInfo!.toJson();
    }
    return data;
  }
}

class Items {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;
  ContentDetails? contentDetails;
  Statistics? statistics;

  Items({this.kind, this.etag, this.id, this.snippet, this.contentDetails, this.statistics});

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    etag = json['etag'];
    id = json['id'];
    snippet = json['snippet'] != null ? new Snippet.fromJson(json['snippet']) : null;
    contentDetails = json['contentDetails'] != null ? new ContentDetails.fromJson(json['contentDetails']) : null;
    statistics = json['statistics'] != null ? new Statistics.fromJson(json['statistics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['etag'] = this.etag;
    data['id'] = this.id;
    if (this.snippet != null) {
      data['snippet'] = this.snippet!.toJson();
    }
    if (this.contentDetails != null) {
      data['contentDetails'] = this.contentDetails!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class Snippet {
  String? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  List<String>? tags;
  String? categoryId;
  String? liveBroadcastContent;
  Localized? localized;
  String? defaultAudioLanguage;

  Snippet({this.publishedAt, this.channelId, this.title, this.description, this.thumbnails, this.channelTitle, this.tags, this.categoryId, this.liveBroadcastContent, this.localized, this.defaultAudioLanguage});

  Snippet.fromJson(Map<String, dynamic> json) {
    publishedAt = json['publishedAt'];
    channelId = json['channelId'];
    title = json['title'];
    description = json['description'];
    thumbnails = json['thumbnails'] != null ? new Thumbnails.fromJson(json['thumbnails']) : null;
    channelTitle = json['channelTitle'];
    tags = json['tags'] != null ? List<String>.from(json['tags']) : null;
    categoryId = json['categoryId'];
    liveBroadcastContent = json['liveBroadcastContent'];
    localized = json['localized'] != null ? new Localized.fromJson(json['localized']) : null;
    defaultAudioLanguage = json['defaultAudioLanguage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publishedAt'] = this.publishedAt;
    data['channelId'] = this.channelId;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails!.toJson();
    }
    data['channelTitle'] = this.channelTitle;
    data['tags'] = this.tags;
    data['categoryId'] = this.categoryId;
    data['liveBroadcastContent'] = this.liveBroadcastContent;
    if (this.localized != null) {
      data['localized'] = this.localized!.toJson();
    }
    data['defaultAudioLanguage'] = this.defaultAudioLanguage;
    return data;
  }
}



class Default {
String? url;
int? width;
int? height;

Default({this.url, this.width, this.height});

Default.fromJson(Map<String, dynamic> json) {
url = json['url'];
width = json['width'];
height = json['height'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['url'] = this.url;
data['width'] = this.width;
data['height'] = this.height;
return data;
}
}

class Localized {
String? title;
String? description;

Localized({this.title, this.description});

Localized.fromJson(Map<String, dynamic> json) {
title = json['title'];
description = json['description'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['title'] = this.title;
data['description'] = this.description;
return data;
}
}

class ContentDetails {
String? duration;
String? dimension;
String? definition;
String? caption;
bool? licensedContent;
RegionRestriction? regionRestriction;
ContentRating? contentRating;
String? projection;

ContentDetails({this.duration, this.dimension, this.definition, this.caption, this.licensedContent, this.regionRestriction, this.contentRating, this.projection});

ContentDetails.fromJson(Map<String, dynamic> json) {
duration = json['duration'];
dimension = json['dimension'];
definition = json['definition'];
caption = json['caption'];
licensedContent = json['licensedContent'];
regionRestriction = json['regionRestriction'] != null ? new RegionRestriction.fromJson(json['regionRestriction']) : null;
contentRating = json['contentRating'] != null ? new ContentRating.fromJson(json['contentRating']) : null;
projection = json['projection'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['duration'] = this.duration;
data['dimension'] = this.dimension;
data['definition'] = this.definition;
data['caption'] = this.caption;
data['licensedContent'] = this.licensedContent;
if (this.regionRestriction != null) {
data['regionRestriction'] = this.regionRestriction!.toJson();
}
if (this.contentRating != null) {
data['contentRating'] = this.contentRating!.toJson();
}
data['projection'] = this.projection;
return data;
}
}

class RegionRestriction {
List<String>? blocked;

RegionRestriction({this.blocked});

RegionRestriction.fromJson(Map<String, dynamic> json) {
blocked = json['blocked'].cast<String>();
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['blocked'] = this.blocked;
return data;
}
}

class ContentRating {




ContentRating.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}

class Statistics {
String? viewCount;
String? likeCount;
String? favoriteCount;
String? commentCount;

Statistics({this.viewCount, this.likeCount, this.favoriteCount, this.commentCount});

Statistics.fromJson(Map<String, dynamic> json) {
viewCount = json['viewCount'];
likeCount = json['likeCount'];
favoriteCount = json['favoriteCount'];
commentCount = json['commentCount'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['viewCount'] = this.viewCount;
data['likeCount'] = this.likeCount;
data['favoriteCount'] = this.favoriteCount;
data['commentCount'] = this.commentCount;
return data;
}
}

class PageInfo {
int? totalResults;
int? resultsPerPage;

PageInfo({this.totalResults, this.resultsPerPage});

PageInfo.fromJson(Map<String, dynamic> json) {
totalResults = json['totalResults'];
resultsPerPage = json['resultsPerPage'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['totalResults'] = this.totalResults;
data['resultsPerPage'] = this.resultsPerPage;
return data;
}
}

class Thumbnails {
Default? defaultthumnails;
Default? medium;
Default? high;
Default? standard;
Default? maxres;

Thumbnails({this.defaultthumnails, this.medium, this.high, this.standard, this.maxres});

Thumbnails.fromJson(Map<String, dynamic> json) {
defaultthumnails = json['default'] != null ? new Default.fromJson(json['default']) : null;
medium = json['medium'] != null ? new Default.fromJson(json['medium']) : null;
high = json['high'] != null ? new Default.fromJson(json['high']) : null;
standard = json['standard'] != null ? new Default.fromJson(json['standard']) : null;
maxres = json['maxres'] != null ? new Default.fromJson(json['maxres']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
if (this.defaultthumnails != null) {
data['default'] = this.defaultthumnails!.toJson();
}
if (this.medium != null) {
data['medium'] = this.medium!.toJson();
}
if (this.high != null) {
data['high'] = this.high!.toJson();
}
if (this.standard != null) {
data['standard'] = this.standard!.toJson();
}
if (this.maxres != null) {
data['maxres'] = this.maxres!.toJson();
}
return data;
}
}