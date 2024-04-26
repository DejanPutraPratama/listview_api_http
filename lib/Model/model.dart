class Post {
  final int id;
  final String title;
  final int price;
  final String description;
  final dynamic image;

  Post(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['category']['image']);
}
