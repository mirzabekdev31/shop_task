class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  bool? is_cart;
  bool? is_like;

  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
        this.is_cart=false,
        this.is_like=false
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    title = json['title']??"";
    price = json['price']??"";
    description = json['description']??"";
    category = json['category']??"";
    image = json['image']??"";
    rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    is_cart=false;
    is_like=false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating_rate': rating?.rate,
      'rating_count': rating?.count,
      'is_cart':false,
      'is_like':false
    };
  }

}



class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}