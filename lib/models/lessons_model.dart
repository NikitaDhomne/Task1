class LessonModel {
  String? requestId;
  List<Items>? items;
  int? count;
  String? anyKey;

  LessonModel({this.requestId, this.items, this.count, this.anyKey});

  LessonModel.fromJson(Map<String, dynamic> json) {
    if (json["requestId"] is String) {
      requestId = json["requestId"];
    }
    if (json["items"] is List) {
      items = json["items"] == null
          ? null
          : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["anyKey"] is String) {
      anyKey = json["anyKey"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["requestId"] = requestId;
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["count"] = count;
    _data["anyKey"] = anyKey;
    return _data;
  }
}

class Items {
  String? createdAt;
  String? name;
  int? duration;
  String? category;
  bool? locked;
  String? id;

  Items(
      {this.createdAt,
      this.name,
      this.duration,
      this.category,
      this.locked,
      this.id});

  Items.fromJson(Map<String, dynamic> json) {
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["locked"] is bool) {
      locked = json["locked"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    _data["name"] = name;
    _data["duration"] = duration;
    _data["category"] = category;
    _data["locked"] = locked;
    _data["id"] = id;
    return _data;
  }
}
