
class Pets {
  final String type;
  final String gender;
  final String size;
  final String age;
  final List<dynamic> photos;
  final bool good_with_children;
  //final String pet_id;
  final String source;

  Pets(
      {required this.type,
      required this.gender,
      required this.size,
      required this.age,
      required this.photos,
      required this.good_with_children,
      //required this.pet_id,
      required this.source});

}