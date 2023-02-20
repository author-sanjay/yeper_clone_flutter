class UserDetailsModel {
  String? uid;
  String? password;
  String? role;
  String? name;
  String? email;
  String? phonenumber;
  String? address;
  String? referalCode;
  bool? isuser;
  String? referralof;
  dynamic? acnumber;
  dynamic? bankname;
  dynamic? idfc;
  dynamic? photo;
  dynamic? gst;
  dynamic? pan;
  List<dynamic>? orders;
  Wallet? wallet;
  List<dynamic>? referrals;
  List<dynamic>? cards;

  UserDetailsModel(
      {this.uid,
      this.password,
      this.role,
      this.name,
      this.email,
      this.phonenumber,
      this.address,
      this.referalCode,
      this.isuser,
      this.referralof,
      this.acnumber,
      this.bankname,
      this.idfc,
      this.photo,
      this.gst,
      this.pan,
      this.orders,
      this.wallet,
      this.referrals,
      this.cards});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    password = json['password'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    referalCode = json['referalCode'];
    isuser = json['isuser'];
    referralof = json['referralof'];
    acnumber = json['acnumber'];
    bankname = json['bankname'];
    idfc = json['idfc'];
    photo = json['photo'];
    gst = json['gst'];
    pan = json['pan'];
    if (json['orders'] != null) {
      orders = json['orders'];
    }
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    if (json['referrals'] != null) {
      referrals = json['referrals'];
      
    }
    if (json['cards'] != null) {
      cards = json['cards'];
      
    }
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
    data['referalCode'] = this.referalCode;
    data['isuser'] = this.isuser;
    data['referralof'] = this.referralof;
    data['acnumber'] = this.acnumber;
    data['bankname'] = this.bankname;
    data['idfc'] = this.idfc;
    data['photo'] = this.photo;
    data['gst'] = this.gst;
    data['pan'] = this.pan;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    if (this.referrals != null) {
      data['referrals'] = this.referrals!.map((v) => v.toJson()).toList();
    }
    if (this.cards != null) {
      data['cards'] = this.cards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wallet {
  int? id;
  int? balance;
  List<dynamic>? txn;

  Wallet({this.id, this.balance, this.txn});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    if (json['txn'] != null) {
      txn = json['txn'];
      
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    if (this.txn != null) {
      data['txn'] = this.txn!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
