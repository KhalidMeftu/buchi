part of 'network_connectivity_bloc.dart';

@immutable
abstract class NetworkConnectivityEvent {}

class CheckNetwork extends NetworkConnectivityEvent {}

class NotifyNetwork extends NetworkConnectivityEvent {
  final bool isConnected;

  NotifyNetwork({this.isConnected = false});
}