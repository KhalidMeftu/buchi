part of 'live_data_filter_bloc.dart';

abstract class LiveDataFilterState extends Equatable {
  const LiveDataFilterState();
}

class LiveDataFilterInitial extends LiveDataFilterState {
  @override
  List<Object> get props => [];
}
class LiveDataFilterLoading extends LiveDataFilterState {
  @override
  List<Object> get props => [];
}
class LiveDataFilterd extends LiveDataFilterState {
  final List<Pets> pets;

  const LiveDataFilterd(this.pets);
  @override
  List<Object> get props => [pets];
}