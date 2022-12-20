// ignore_for_file: empty_constructor_bodies, override_on_non_overriding_member, file_names



class Gettxn {
  String date;
  bool incoming;
  int amount;

  Gettxn(this.date, this.incoming, this.amount);

  Gettxn.fromJson(Map<dynamic, dynamic> json)
      : date = json["date"],
        incoming = json["incoming"],
        amount = json["amount"];

  static List<Gettxn> dealsfromapi(List api) {
    return api.map((e) {
      return Gettxn.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{date:$date, incoming:$incoming, amount:$amount';
  }
}
