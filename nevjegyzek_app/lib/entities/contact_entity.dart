

class ContactEntity {

  static int _lastId = 0;

  String name;
  String phoneNumber;
  String email = '';
  int id;

  ContactEntity(this.name, this.phoneNumber, this.email, this.id);


  static int getNewContactId(){
    _lastId++;
    return _lastId;
  }




}