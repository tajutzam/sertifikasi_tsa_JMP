import 'package:sertifikasi_jmp/database/sqlhelper.dart';
import 'package:sertifikasi_jmp/model/user.dart';

class UserService {

  static Future<int> updateData(UserModel userModel , id) async {
    return SqlHelper.updateData(userModel , id);
  }
}
