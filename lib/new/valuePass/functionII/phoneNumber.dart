
class PhoneNumber {

  String _phoneNumber;

  String _dateTime;


  PhoneNumber(this._phoneNumber, this._dateTime);

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get dateTime => _dateTime;

  set dateTime(String value) {
    _dateTime = value;
  }

  @override
  String toString() {
    return 'PhoneNumber{_phoneNumber: $_phoneNumber, _dateTime: $_dateTime}';
  }

}