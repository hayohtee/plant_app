class Plant {
  Plant({
    required this.plantId,
    required this.price,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.category,
    required this.plantName,
    required this.imageURL,
    required this.description,
    required this.isFavorite,
    required this.isSelected,
  });

  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorite;
  final String description;
  bool isSelected;
}
