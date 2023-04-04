part of 'live_data_filter_bloc.dart';

abstract class LiveDataFilterEvent extends Equatable {
  const LiveDataFilterEvent();
}

class FilterListEvent extends LiveDataFilterEvent
{
  final List<String> selectedPets;
  final bool gwc;
  final String age;
  final String gender;
  final String size;

  const FilterListEvent(this.selectedPets, this.gwc, this.age, this.gender, this.size);
  @override
  // TODO: implement props
  List<Object?> get props => [selectedPets, age, gender, size];

}