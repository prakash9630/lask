

import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig{
  EnvironmentConfig._();
  static final baseUrl = dotenv.get('BASE_URL');
  static final stripSecret = dotenv.get('STRIPE_SECRET');
  static final stripPublic = dotenv.get('STRIPE_PUBLIC');


}