
import '../entities/contact_entity.dart';

class AllContacts{



  var _contacts = {
    'A':[
      ContactEntity('Adorján Gergő', '+36 20 548 6987', 'adorjangergo@gmail.com', 1),
      ContactEntity('Albrecht Réka', '+36 20 548 6987', 'albrechtreka@gmail.com', 2),
      ContactEntity('Apportyán Iván', '+36 20 548 6987', 'apportyanivan@gmail.com', 3),
    ],
    'B': [
      ContactEntity('Beles Kitti', '+36 20 548 6987', 'beleskitti@gmail.com', 4),
      ContactEntity('Boros Lajos', '+36 20 548 6987', 'boroslajos@gmail.com', 5),
    ]
  };

  get contacts => _contacts;

}