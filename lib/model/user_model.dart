class UserModel {
  String profId;
  String fullname;
  String username;
  String emailId;
  String profimg;

  UserModel(
      {this.profId, this.fullname, this.username, this.emailId, this.profimg});

  Map toMap(UserModel userMap) {
    var data = <String, dynamic>{};
    data['profId'] = userMap.profId;
    data['fullname'] = userMap.fullname;
    data['username'] = userMap.username;
    data['emailId'] = userMap.emailId;
    data['profimg'] = userMap.profimg;
    return data;
  }
}
