class HomeSliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brand;
  HomeSliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,

  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> jsonData) {
    return HomeSliderModel(
      id: jsonData['_id'] ,
      photoUrl: jsonData['photo_url'] ,
      description: jsonData['description'] ,
      brand: jsonData['brand'] ,

    );
  }
  }

