import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'api_key.dart';

part 'rest_client.g.dart';

//? ---------------------------------------------------------------------
//* Add new request http here. Then run command
//* "flutter pub run build_runner build --delete-conflicting-outputs"
//? ---------------------------------------------------------------------
@RestApi(baseUrl: ApiKey.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

}
