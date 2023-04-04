part of 'network_connectivity_bloc.dart';

@immutable
abstract class NetworkConnectivityState {}

class NetworkConnectivityInitial extends NetworkConnectivityState {}

class NetworkSuccess extends NetworkConnectivityState {}

class NetworkFailure extends NetworkConnectivityState {}