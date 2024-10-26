class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel(
      {this.id,
      this.object,
      this.associatedObjects,
      this.created,
      this.expires,
      this.livemode,
      this.secret});

  EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    object = json["object"];
    associatedObjects = json["associated_objects"] == null
        ? null
        : (json["associated_objects"] as List)
            .map((e) => AssociatedObjects.fromJson(e))
            .toList();
    created = json["created"];
    expires = json["expires"];
    livemode = json["livemode"];
    secret = json["secret"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["object"] = object;
    if (associatedObjects != null) {
      data["associated_objects"] =
          associatedObjects?.map((e) => e.toJson()).toList();
    }
    data["created"] = created;
    data["expires"] = expires;
    data["livemode"] = livemode;
    data["secret"] = secret;
    return data;
  }
}

class AssociatedObjects {
  String? id;
  String? type;

  AssociatedObjects({this.id, this.type});

  AssociatedObjects.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["type"] = type;
    return data;
  }
}
