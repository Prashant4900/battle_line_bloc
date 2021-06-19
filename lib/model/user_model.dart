class UserModel {
  UserModel({this.uid});

  final String? uid;

  factory UserModel.initialData() {
    return UserModel(uid: null);
  }
}
