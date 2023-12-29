class ProductDetailsModel {
  int? id;
  String? title;
  num? price;
  String? images;

  ProductDetailsModel({
    this.id,
    this.title,
    this.price,
    this.images,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;

    data['price'] = this.price;

    data['images'] = this.images;

    return data;
  }
}
