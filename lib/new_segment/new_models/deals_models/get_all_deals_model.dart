class GetAllDealsModel {
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

  GetAllDealsModel({
    this.id,
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
  });

  GetAllDealsModel.fromJson(Map<String, dynamic> json) {
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

    return data;
  }
}
