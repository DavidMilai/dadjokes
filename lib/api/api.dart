import '../config.dart';
import 'dio_api.dart';

class Api extends DioApi {
  Api() : super(Config.apiUrl);

  Future getJoke() {
    return dio.get(
      "/slack",
    );
  }
}

Api api = Api();
