class Restaurant {
  String restaurantName;
  String location;
  String speciality;
  String opensAt;
  String closesAt;
  int rating;
  String imageUrl;
  String pdfUrl;

  Restaurant(
      {this.restaurantName,
        this.location,
        this.speciality,
        this.opensAt,
        this.closesAt,
        this.rating,
        this.imageUrl,
        this.pdfUrl});

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantName = json['restaurantName'];
    location = json['location'];
    speciality = json['speciality'];
    opensAt = json['opensAt'];
    closesAt = json['closesAt'];
    rating = json['rating'];
    imageUrl = json['imageUrl'];
    pdfUrl = json['pdfUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurantName'] = this.restaurantName;
    data['location'] = this.location;
    data['speciality'] = this.speciality;
    data['opensAt'] = this.opensAt;
    data['closesAt'] = this.closesAt;
    data['rating'] = this.rating;
    data['imageUrl'] = this.imageUrl;
    data['pdfUrl'] = this.pdfUrl;
    return data;
  }
}