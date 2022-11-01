import 'package:sertifikasi_jmp/database/sqlhelper.dart';
import 'package:sertifikasi_jmp/model/user.dart';

class LoginService {
  static login(UserModel userModel) async {
    var data = await SqlHelper.findByUsername(userModel);

    if (data.length != 0) {
      if (data[0]['username'] != userModel.username) {
        data = [];
        return data;
      } else if (data[0]['username'] == userModel.username &&
          data[0]['password'] == userModel.password) {
        return data;
      } else if (data[0]['username'] == userModel.username ||
          data[0]['password'] == userModel.password) {
        data = [];
        return data;
      }
    } else {
      data = [];
      return data;
    }
  }
  
  static findAll() async {
    final users = await SqlHelper.findAll();
    print(users);
  }
}
