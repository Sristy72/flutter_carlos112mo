class UserProfileRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? username;
  int? age;
  Address? address;
  String? position;
  String? favoriteClub;
  TredingProfile? tredingProfile;

  UserProfileRequestModel(
      {this.name,
        this.email,
        this.password,
        this.phone,
        this.username,
        this.age,
        this.address,
        this.position,
        this.favoriteClub,
        this.tredingProfile});

  UserProfileRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    username = json['username'];
    age = json['age'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    position = json['position'];
    favoriteClub = json['FavoriteClub'];
    tredingProfile = json['treding_profile'] != null
        ? TredingProfile.fromJson(json['treding_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['username'] = username;
    data['age'] = age;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['position'] = position;
    data['FavoriteClub'] = favoriteClub;
    if (tredingProfile != null) {
      data['treding_profile'] = tredingProfile!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? state;
  String? street;
  String? zipCode;

  Address({this.city, this.state, this.street, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    state = json['state'];
    street = json['street'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['state'] = state;
    data['street'] = street;
    data['zipCode'] = zipCode;
    return data;
  }
}

class TredingProfile {
  String? tradingExprience;
  String? assetsOfInterest;
  String? mainGoal;
  String? riskAppetite;
  List<String>? prefferedLearning;

  TredingProfile(
      {this.tradingExprience,
        this.assetsOfInterest,
        this.mainGoal,
        this.riskAppetite,
        this.prefferedLearning});

  TredingProfile.fromJson(Map<String, dynamic> json) {
    tradingExprience = json['trading_exprience'];
    assetsOfInterest = json['assets_of_interest'];
    mainGoal = json['main_goal'];
    riskAppetite = json['risk_appetite'];
    prefferedLearning = json['preffered_learning'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trading_exprience'] = tradingExprience;
    data['assets_of_interest'] = assetsOfInterest;
    data['main_goal'] = mainGoal;
    data['risk_appetite'] = riskAppetite;
    data['preffered_learning'] = prefferedLearning;
    return data;
  }
}