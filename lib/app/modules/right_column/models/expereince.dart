import 'dart:convert';

class Experience {
  final String name;
  final List<String> role;
  final String description;
  final bool homeVisibility;
  final String timeline;
  final List<String> tags;
  final List<String> refUrls;
  final List<String> refTexts;
  final String url;

  Experience({
    required this.name,
    required this.role,
    required this.description,
    required this.homeVisibility,
    required this.timeline,
    required this.tags,
    required this.url,
    required this.refUrls,
    required this.refTexts,
  });

  Experience copyWith({
    String? name,
    List<String>? role,
    String? description,
    bool? homeVisibility,
    String? timeline,
    List<String>? tags,
    List<String>? refTexts,
    List<String>? refUrls,
    String? url,
  }) =>
      Experience(
        name: name ?? this.name,
        role: role ?? this.role,
        description: description ?? this.description,
        homeVisibility: homeVisibility ?? this.homeVisibility,
        timeline: timeline ?? this.timeline,
        tags: tags ?? this.tags,
        url: url ?? this.url,
        refTexts: refTexts ?? this.refTexts,
        refUrls: refUrls ?? this.refUrls,
      );

  factory Experience.fromRawJson(String str) =>
      Experience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        name: json["name"],
        role: List<String>.from(json["role"].map((x) => x)),
        description: json["description"],
        homeVisibility: json["homeVisibility"],
        timeline: json["timeline"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        url: json["url"],
        refTexts: List<String>.from(json["refTexts"].map((x) => x)),
        refUrls: List<String>.from(json["refUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": List<dynamic>.from(role.map((x) => x)),
        "description": description,
        "homeVisibility": homeVisibility,
        "timeline": timeline,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "url": url,
        "refTexts": List<dynamic>.from(refTexts.map((x) => x)),
        "refUrls": List<dynamic>.from(refUrls.map((x) => x)),
      };
}

/*
{
  "name": "HeyDocs",
  "role": [
    "Unity 3D developer"
  ],
  "description": "description will come here",
  "homeVisibility": false,
  "startDate": "2022-03-01T14:30:00.000Z",
  "endDate": "2022-03-01T14:30:00.000Z",
  "tags": [
    "react",
    "unity",
    "firebase"
  ]
}
 */