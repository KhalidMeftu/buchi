import 'package:connectivity_plus/connectivity_plus.dart';

import '../../presentation/controller/network_bloc/network_connectivity_bloc.dart';
class NetworkHelper {

  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkConnectivityBloc().add(NotifyNetwork());
      } else {
        NetworkConnectivityBloc().add(NotifyNetwork(isConnected: true));
      }
    });
  }
}