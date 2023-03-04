class SingleProductModel {
  int? id;
  String? productName;
  String? description;
  int? actualPrice;
  int? offerPrice;
  String? card;
  int? userEarning;
  String? photourl;
  int? countleft;
  bool? active;
  String? offerlink;
  String? platform;
  String? name;
  dynamic deliverto;
  dynamic addresssfordelivery;
  int? pincode;
 dynamic offerdetails;
  List<Orders>? orders;

  SingleProductModel(
      {this.id,
      this.productName,
      this.description,
      this.actualPrice,
      this.offerPrice,
      this.card,
      this.userEarning,
      this.photourl,
      this.countleft,
      this.active,
      this.offerlink,
      this.platform,
      this.name,
      this.deliverto,
      this.addresssfordelivery,
      this.pincode,
      this.offerdetails,
      this.orders});

  SingleProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    description = json['description'];
    actualPrice = json['actual_price'];
    offerPrice = json['offer_price'];
    card = json['card'];
    userEarning = json['user_earning'];
    photourl = json['photourl'];
    countleft = json['countleft'];
    active = json['active'];
    offerlink = json['offerlink'];
    platform = json['platform'];
    name = json['name'];
    deliverto = json['deliverto'];
    addresssfordelivery = json['addresssfordelivery'];
    pincode = json['pincode'];
    offerdetails = json['offerdetails'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['actual_price'] = this.actualPrice;
    data['offer_price'] = this.offerPrice;
    data['card'] = this.card;
    data['user_earning'] = this.userEarning;
    data['photourl'] = this.photourl;
    data['countleft'] = this.countleft;
    data['active'] = this.active;
    data['offerlink'] = this.offerlink;
    data['platform'] = this.platform;
    data['name'] = this.name;
    data['deliverto'] = this.deliverto;
    data['addresssfordelivery'] = this.addresssfordelivery;
    data['pincode'] = this.pincode;
    data['offerdetails'] = this.offerdetails;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? status;
  String? product;
  String? date;
  String? courier;
  int? deal;
  int? otp;
  int? phonenumberr;
  String? platformtxnid;

  Orders(
      {this.id,
      this.status,
      this.product,
      this.date,
      this.courier,
      this.deal,
      this.otp,
      this.phonenumberr,
      this.platformtxnid});

  Orders.fromJson(Map<String, dynamic> json) {
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
