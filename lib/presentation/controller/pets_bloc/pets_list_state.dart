part of 'pets_list_bloc.dart';

abstract class PetsListState extends Equatable {
  const PetsListState();
}

class PetsListInitial extends PetsListState {
  @override
  List<Object> get props => [];
}

class PetsList extends PetsListState{
  final List<Pets> petsList;
  final RequestState serverpetsList;

  PetsList(this.petsList, this.serverpetsList);

  @override
  // TODO: implement props
  List<Object?> get props => [petsList, serverpetsList];
}
