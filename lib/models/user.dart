
class User {
  Data data;
  int statusCode;
  String errorMessage;
  bool isVerified;
  bool isAnonymous;
  bool profileDataCompleted;

  User(
      {this.data,
        this.statusCode,
        this.errorMessage,
        this.isVerified,
        this.isAnonymous,
        this.profileDataCompleted});

  User.fromJson(Map<String, dynamic> json) {
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

class DataUser {
  int id;
  String name;
  String phoneNumber;
  String imageUrl;
  String role;
  String email;
  String gender;
  String genderId;
  String birthDate;
  String token;

  DataUser(
      {this.id,
        this.name,
        this.genderId,
        this.phoneNumber,
        this.imageUrl,
        this.role,
        this.email,
        this.gender,
        this.birthDate,
        this.token});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"Not found";
    phoneNumber = json['phoneNumber']??"Not found";
    imageUrl = json['imageUrl']??"Not found";
    role = json['role']??"Not found";
    email = json['email']??"Not found";
    gender = json['gender']??"Not found";
    genderId = json['genderId']??"Not found";
    birthDate = json['birthDate']??"Not found";
    token = json['token']??"Not found";
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

class Gender{
  int id=0;
  String name="";

  Gender(this.id,this.name);

}
