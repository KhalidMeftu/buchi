
import 'package:equatable/equatable.dart';

import '../../../data/model/pets_model.dart';

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

class AddRandomFruit extends PetsLocalDbEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateWithRandomFruit extends PetsLocalDbEvent {
  final PetsModel  updatedFruit;


  const UpdateWithRandomFruit(this.updatedFruit) : super();

  @override
  // TODO: implement props
  List<Object?> get props =>[updatedFruit];
}

class DeleteFruit extends PetsLocalDbEvent {
  final PetsModel  fruit;

  const DeleteFruit(this.fruit) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [fruit];
}