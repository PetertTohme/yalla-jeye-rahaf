class PersonalInfoModel {
  Data data;
  int statusCode;
  String errorMessage;
  bool isVerified;
  bool isAnonymous;
  bool profileDataCompleted;

  PersonalInfoModel(
      {this.data,
        this.statusCode,
        this.errorMessage,
        this.isVerified,
        this.isAnonymous,
        this.profileDataCompleted});

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    isVerified = json['isVerified'];
    isAnonymous = json['isAnonymous'];
    profileDataCompleted = json['profileDataCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['errorMessage'] = this.errorMessage;
    data['isVerified'] = this.isVerified;
    data['isAnonymous'] = this.isAnonymous;
    data['profileDataCompleted'] = this.profileDataCompleted;
    return data;
  }
}

class Data {
  String message;
  Data data;

  Data({this.message, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class PersonalData {
  int id;
  String name;
  String phoneNumber;
  String imageUrl;
  String role;
  String email;
  String gender;
  int genderId;
  String birthDate;
  String token;

  PersonalData(
      {this.id,
        this.name,
        this.phoneNumber,
        this.imageUrl,
        this.role,
        this.email,
        this.gender,
        this.genderId,
        this.birthDate,
        this.token});

  PersonalData.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??'not found';
    phoneNumber = json['phoneNumber']??'not found';
    imageUrl = json['imageUrl']??'not found';
    role = json['role']??'not found';
    email = json['email']??'not found';
    gender = json['gender']??'not found';
    genderId = json['genderId']??0;
    birthDate = json['birthDate']??'not found';
    token = json['token']??'not found';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['role'] = this.role;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['genderId'] = this.genderId;
    data['birthDate'] = this.birthDate;
    data['token'] = this.token;
    return data;
  }
}