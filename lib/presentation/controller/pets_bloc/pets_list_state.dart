part of 'pets_list_bloc.dart';

abstract class PetsListState extends Equatable {
  const PetsListState();
}

class PetsListInitial extends PetsListState {
  @override
  List<Object> get props => [];
}

class PetsListLoading extends PetsListState{
  final RequestState serverpetsList;
  const PetsListLoading(this.serverpetsList);
  @override
  // TODO: implement props
  List<Object?> get props => [serverpetsList];

}

class AllPetsListState extends PetsListState{
  final List<Pets> petsList;
  final RequestState serverpetsList;

  const AllPetsListState(this.petsList, this.serverpetsList);

  @override
  // TODO: implement props
  List<Object?> get props => [petsList, serverpetsList];
}
