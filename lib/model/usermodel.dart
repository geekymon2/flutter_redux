class User {
  String _name;
  String _gender;
  String _location;
  String _email;

  User(this._name, this._gender, this._location, this._email);

  String get name {
    return _name;
  }

  String get gender {
    return _gender;
  }

  String get location {
    return _location;
  }

  String get email {
    return _email;
  }
}
