class OrderItemModel {
  int? id;
  String? status;
  String? product;
  String? date;
 dynamic courier;
  int? deal;
  int? otp;
  String? platformtxnid;

  OrderItemModel(
      {this.id,
      this.status,
      this.product,
      this.date,
      this.courier,
      this.deal,
      this.otp,
      this.platformtxnid});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    product = json['product'];
    date = json['date'];
    courier = json['courier'];
    deal = json['deal'];
    otp = json['otp'];
    platformtxnid = json['platformtxnid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['product'] = this.product;
    data['date'] = this.date;
    data['courier'] = this.courier;
    data['deal'] = this.deal;
    data['otp'] = this.otp;
    data['platformtxnid'] = this.platformtxnid;
    return data;
  }
}
