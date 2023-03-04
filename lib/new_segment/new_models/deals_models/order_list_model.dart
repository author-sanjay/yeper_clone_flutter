class OrderListModel {
  int? id;
  dynamic status;
  String? product;
  String? date;
  String? courier;
  int? deal;
  int? otp;
  int? phonenumberr;
  String? platformtxnid;

  OrderListModel(
      {this.id,
      this.status,
      this.product,
      this.date,
      this.courier,
      this.deal,
      this.otp,
      this.phonenumberr,
      this.platformtxnid});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    product = json['product'];
    date = json['date'];
    courier = json['courier'];
    deal = json['deal'];
    otp = json['otp'];
    phonenumberr = json['phonenumberr'];
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
    data['phonenumberr'] = this.phonenumberr;
    data['platformtxnid'] = this.platformtxnid;
    return data;
  }
}
