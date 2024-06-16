// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isInternet;
}

// todo remote have a methode to check if my server is online
class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker connectionChecker;

  NetworkInfoImpl({
    required this.connectionChecker,
  });

  //todo remote
  @override
  Future<bool> get isInternet =>
      Future.value(false); //connectionChecker.hasConnection;
}
