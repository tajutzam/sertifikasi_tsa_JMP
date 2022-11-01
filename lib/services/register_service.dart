import 'package:sertifikasi_jmp/database/sqlhelper.dart';
import 'package:sertifikasi_jmp/model/user.dart';

class RegisterService {
  static register(UserModel userModel) async {
    var data = await SqlHelper.insertData(userModel);
  }
}
