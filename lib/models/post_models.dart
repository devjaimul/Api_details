class PostsModel {
  final String name;
  final String img;

  PostsModel({required this.name, required this.img});

  factory PostsModel.fromJson(Map<String, dynamic> json,) {
   return PostsModel(name: json['first_name '], img: json['avatar']);

  }



}
