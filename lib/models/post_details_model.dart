class PostDetailsModel {
  final String name;
  final String img;
  final String? id;
 // final Author author;

  PostDetailsModel(
      {required this.name,
      required this.img,
      required this.id,
      //required this.author
      });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
        name: json['first_name'],
        img: json['avatar'],
        id: json['id'].toString(),
       // author: Author.fromJson(json['author']) //oikhne list ar ja nam thakbe seta



        );
  }
}

//jdi nested list thake mane ar moddhe r akta list thakto aurthor name thaole seta kivabe get korte hoto
class Author {
  final String name;
  final String img;
  final String? id;

  Author({required this.name, required this.img, required this.id});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['first_name'],
      img: json['avatar'],
      id: json['id'].toString(),
    );
  }
}
// avabe get korte hbe data
//subtitle: Text(snapshot.data!.author.name),