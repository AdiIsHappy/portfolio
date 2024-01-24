// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  String name;
  String description;
  bool homeVisibility;
  String thumnailUrl;
  String url;
  List<String> tags;
  List<String> extrasUrl;
  List<String> extrasText;

  Project({
    required this.name,
    required this.description,
    required this.homeVisibility,
    required this.thumnailUrl,
    required this.url,
    required this.tags,
    required this.extrasUrl,
    required this.extrasText,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        name: json["name"],
        description: json["description"],
        homeVisibility: json["homeVisibility"],
        thumnailUrl: json["thumnailUrl"],
        url: json["url"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        extrasUrl: List<String>.from(json["extrasUrl"].map((x) => x)),
        extrasText: List<String>.from(json["extrasText"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "homeVisibility": homeVisibility,
        "thumnailUrl": thumnailUrl,
        "url": url,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "extrasUrl": List<dynamic>.from(extrasUrl.map((x) => x)),
        "extrasText": List<dynamic>.from(extrasText.map((x) => x)),
      };
}



/*
{
  "name": "HeyDocs",
  "description": "description will come here",
  "homeVisibility": false,
  "thumnailUrl": "http://google.com",
  "projectUrl": "http",
  "tags": [
    "react",
    "unity",
    "firebase"
  ],
  "extrasUrl": [
      "hello"
      ],
  "extrasText": [
      "hello"
      ]
}
 */