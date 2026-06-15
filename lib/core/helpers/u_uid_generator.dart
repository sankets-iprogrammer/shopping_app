import 'package:uuid/uuid.dart';

class UUidGenerator {
  static var uuid = Uuid();
  static String getUniqueKey(){
    return uuid.v4();
  }
}