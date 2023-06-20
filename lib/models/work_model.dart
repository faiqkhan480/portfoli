// To parse this JSON data, do
//
//     final work = workFromMap(jsonString);

import 'dart:convert';

Work workFromMap(String str) => Work.fromMap(json.decode(str));

String workToMap(Work data) => json.encode(data.toMap());

class Work {
  String? title;
  String? description;
  String? icon;
  String? image;
  String? appStoreLink;
  String? playStoreLink;

  Work({
    this.title,
    this.description,
    this.icon,
    this.image,
    this.appStoreLink,
    this.playStoreLink,
  });

  Work copyWith({
    String? title,
    String? description,
    String? icon,
    String? image,
    String? appStoreLink,
    String? playStoreLink,
  }) =>
      Work(
        title: title ?? this.title,
        description: description ?? this.description,
        icon: icon ?? this.icon,
        image: image ?? this.image,
        appStoreLink: appStoreLink ?? this.appStoreLink,
        playStoreLink: playStoreLink ?? this.playStoreLink,
      );

  factory Work.fromMap(Map<String, dynamic> json) => Work(
    title: json["title"],
    description: json["description"],
    icon: json["icon"],
    image: json["image"],
    appStoreLink: json["app_store_link"],
    playStoreLink: json["play_store_link"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description,
    "icon": icon,
    "image": image,
    "app_store_link": appStoreLink,
    "play_store_link": playStoreLink,
  };
}
