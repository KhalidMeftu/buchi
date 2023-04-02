
class Pets {
  final String type;
  final String gender;
  final String size;
  final String age;
  final List<Photo> photos;
  final bool good_with_children;
  final String source;

  Pets(
      {required this.type,
      required this.gender,
      required this.size,
      required this.age,
      required this.photos,
      required this.good_with_children,
      required this.source});

}

class Photo {
  Photo({
    required this.url,
  });

  String? url;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"]??'',
  );


}