class UserModel {
  int ?id;
  String ?name;
  String ?username;
  String ?password;
  String ?noHp;

  // UserModel({required this.id, required this.name , required this.username , required this.noHp , required this.password});

  // UserModel.fromJson(Map<String, dynamic> json){
  //     this.id = json['id'];
  //     this.name = json['name'];
  // }

  // Map<String, dynamic> toJson(){
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
