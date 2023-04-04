part of 'fruits_bloc.dart';

abstract class PetsLocalDbState extends Equatable {
  const PetsLocalDbState();
}

class FruitsInitial extends PetsLocalDbState {
  @override
  List<Object> get props => [];
}

class LocalDbPetsLoading extends PetsLocalDbState  {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PetsLocalDBLoaded extends PetsLocalDbState  {
  final List<PetsModel> pets;

  const PetsLocalDBLoaded(this.pets) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [pets];
}

class PetsLocalDbEmpty extends PetsLocalDbState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class PetsOnlineSearchEmpty extends PetsLocalDbState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}