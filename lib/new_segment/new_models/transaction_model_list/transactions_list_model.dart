class Transactionslist {
  String date;
  bool incoming;
  int amount;
  dynamic message;

  Transactionslist(this.date, this.incoming, this.amount, this.message);

  Transactionslist.fromJson(Map<dynamic, dynamic> json)
      : date = json["date"],
        incoming = json["incoming"],
        amount = json["amount"],
        message = json["message"];

  static List<Transactionslist> dealsfromapi(List api) {
    return api.map((e) {
      return Transactionslist.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{date:$date, incoming:$incoming, amount:$amount ,name:$message';
  }
}
