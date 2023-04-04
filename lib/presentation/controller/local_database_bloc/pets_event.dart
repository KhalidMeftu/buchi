
import 'package:equatable/equatable.dart';


abstract class PetsLocalDbEvent extends Equatable {
  const PetsLocalDbEvent();
}

class LoadPets extends PetsLocalDbEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadPetsWithSearch extends PetsLocalDbEvent {
  final List<String> selectedPets;
  final bool gwc;
  final String age;
  final String gender;
  final String size;

  const LoadPetsWithSearch(this.selectedPets,this.gwc, this.age, this.gender, this.size);
  @override
  // TODO: implement props
  List<Object?> get props => [selectedPets, age, gender, size];
}

