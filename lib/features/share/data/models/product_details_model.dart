class ProductDetailsModel {
  final String id;
  final List<String> colors;
  final List<String> sizes;
  final String title;
  final String description;
  final List<String> photos;
  final double currentPrice;

  ProductDetailsModel({
    required this.id,
    required this.colors,
    required this.sizes,
    required this.title,
    required this.description,
    required this.photos,
    required this.currentPrice,
  });

  // Factory constructor to parse JSON
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      colors:List<String>.from(json['colors'].map((e) => e.toString())),
      sizes: List<String>.from(json['sizes'].map((e) => e.toString())),
      title: json['title'],
      description: json['description'],
      photos: List<String>.from(json['photos'].map((e) => e.toString())),
      currentPrice: json['currentPrice'],
    );
  }
}
