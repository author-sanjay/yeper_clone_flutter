// ignore_for_file: override_on_non_overriding_member, file_names

class GetOrders {
  int orderid;
  String orderstatus;
  String date;
  String product;
  int deal;
  GetOrders(this.orderid, this.date, this.deal, this.orderstatus, this.product);

  GetOrders.fromJson(Map<dynamic, dynamic> json)
      : orderstatus = json["order_status"],
        date = json["date"] as String,
        product = json["product"],
        deal = json["deal"] as int,
        orderid = json["id"] as int;

  static List<GetOrders> dealsfromapi(List api) {
    return api.map((e) {
      return GetOrders.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{orderstatus:$orderstatus, date:$date, product:$product, deal:$deal, orderid:$orderid';
  }
}
