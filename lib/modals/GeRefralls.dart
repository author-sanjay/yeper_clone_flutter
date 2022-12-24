// ignore_for_file: empty_constructor_bodies, override_on_non_overriding_member, file_names

class GetRef {
  int id;
  String date;
  String name;

  GetRef(this.id, this.date, this.name);

  GetRef.fromJson(Map<String, dynamic> json)
      : date = json["date"],
        name = json["name"],
        id = json["id"];

  static List<GetRef> dealsfromapi(List api) {
    return api.map((e) {
      return GetRef.fromJson(e);
    }).toList();
  }

  // @override
  // String tostring() {
  //   return '{name:$name, ';
  // }
}
