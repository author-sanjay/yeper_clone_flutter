class ReferalModel {
  int? id;
  String? date;
  Userof? userof;
  String? name;
  dynamic contri;

  ReferalModel({this.id, this.date, this.userof, this.name, this.contri});

  ReferalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    userof =
        json['userof'] != null ? new Userof.fromJson(json['userof']) : null;
    name = json['name'];
    contri = json['contri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.userof != null) {
      data['userof'] = this.userof!.toJson();
    }
    data['name'] = this.name;
    data['contri'] = this.contri;
    return data;
  }
}

class Userof {
  String? uid;
  String? password;
  String? role;
  String? name;
  String? email;
  String? phonenumber;
  dynamic address;
  String? referalcode;
  bool? isuser;
  String? referralof;
  dynamic acnumber;
  dynamic bankname;
  dynamic idfc;
  dynamic photo;
  dynamic gst;
  dynamic pan;
  dynamic upi;
  dynamic referralcontribution;
  dynamic accountholdername;
  List<Orders>? orders;
  Wallet? wallet;

  Userof(
      {this.uid,
      this.password,
      this.role,
      this.name,
      this.email,
      this.phonenumber,
      this.address,
      this.referalcode,
      this.isuser,
      this.referralof,
      this.acnumber,
      this.bankname,
      this.idfc,
      this.photo,
      this.gst,
      this.pan,
      this.upi,
      this.referralcontribution,
      this.accountholdername,
      this.orders,
      this.wallet});

  Userof.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    password = json['password'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    referalcode = json['referalcode'];
    isuser = json['isuser'];
    referralof = json['referralof'];
    acnumber = json['acnumber'];
    bankname = json['bankname'];
    idfc = json['idfc'];
    photo = json['photo'];
    gst = json['gst'];
    pan = json['pan'];
    upi = json['upi'];
    referralcontribution = json['referralcontribution'];
    accountholdername = json['accountholdername'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['password'] = this.password;
    data['role'] = this.role;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phonenumber'] = this.phonenumber;
    data['address'] = this.address;
    data['referalcode'] = this.referalcode;
    data['isuser'] = this.isuser;
    data['referralof'] = this.referralof;
    data['acnumber'] = this.acnumber;
    data['bankname'] = this.bankname;
    data['idfc'] = this.idfc;
    data['photo'] = this.photo;
    data['gst'] = this.gst;
    data['pan'] = this.pan;
    data['upi'] = this.upi;
    data['referralcontribution'] = this.referralcontribution;
    data['accountholdername'] = this.accountholdername;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? status;
  String? product;
  String? date;
  dynamic courier;
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

class Wallet {
  int? id;
  int? balance;

  Wallet({this.id, this.balance});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    return data;
  }
}
