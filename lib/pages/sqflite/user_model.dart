class UserModel {
  int id;
  String mobile;
  String headImage;

  UserModel({this.id, this.mobile, this.headImage});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    headImage = json['headImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['headImage'] = this.headImage;
    return data;
  }
}
