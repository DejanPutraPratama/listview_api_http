class Post {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;

  Post(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      images: List.from(json['images']));
}
