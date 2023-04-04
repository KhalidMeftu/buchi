part of 'fruits_bloc.dart';

abstract class PetsLocalDbEvent extends Equatable {
  const PetsLocalDbEvent();
}

class LoadFruits extends PetsLocalDbEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadFruitsWithSearch extends PetsLocalDbEvent {
  final List<String> selectedPets;
  final bool gwc;
  final String age;
  final String gender;
  final String size;

  const LoadFruitsWithSearch(this.selectedPets,this.gwc, this.age, this.gender, this.size);
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
  //final Fruit updatedFruit;
  final PetsModel  updatedFruit;


  const UpdateWithRandomFruit(this.updatedFruit) : super();

  @override
  // TODO: implement props
  List<Object?> get props =>[updatedFruit];
}

class DeleteFruit extends PetsLocalDbEvent {
  //final Fruit fruit;
  final PetsModel  fruit;

  const DeleteFruit(this.fruit) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [fruit];
}