import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../const/network/network_helper.dart';

part 'network_connectivity_event.dart';
part 'network_connectivity_state.dart';

class NetworkConnectivityBloc extends Bloc<NetworkConnectivityEvent, NetworkConnectivityState> {
  NetworkConnectivityBloc() : super(NetworkConnectivityInitial()) {
    on<CheckNetwork>((event, emit) {
      // TODO: implement event handler
      NetworkHelper.observeNetwork();

    });
    //NotifyNetwork

    on<NotifyNetwork>((event, emit) {
      // TODO: implement event handler
      event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
    });


  }
}
