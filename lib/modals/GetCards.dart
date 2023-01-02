// ignore_for_file: empty_constructor_bodies, override_on_non_overriding_member, file_names

class GetCard {
  int id;
  String photo;
  String name;

  GetCard(this.id, this.photo, this.name);

  GetCard.fromJson(Map<String, dynamic> json)
      : photo = json["photo"],
        name = json["name"],
        id = json["id"];

  static List<GetCard> dealsfromapi(List api) {
    return api.map((e) {
      return GetCard.fromJson(e);
    }).toList();
  }

  // @override
  // String tostring() {
  //   return '{name:$name, ';
  // }
}
