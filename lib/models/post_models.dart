class PostsModel {
  final String name;
  final String img;
  final String? id;

  PostsModel({required this.name, required this.img, this.id});

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      name: json['first_name'],
      img: json['avatar'],
      id: json['id'].toString(),
    );
  }
}