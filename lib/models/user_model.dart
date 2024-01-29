class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? telepon;
  String? alamat;
  String? noKTP;
  String? noSIM;
  String? profilImage;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.telepon,
      this.alamat,
      this.noKTP,
      this.noSIM,
      this.profilImage});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      telepon: map['telepon'],
      alamat: map['alamat'],
      noKTP: map['noKTP'],
      noSIM: map['noSIM'],
      profilImage: map['profilImage'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'telepon': telepon,
      'alamat': alamat,
      'noKTP': noKTP,
      'noSIM': noSIM,
      'profilImage': profilImage,
    };
  }
}
