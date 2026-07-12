import 'package:TetherUs/models/redirecter.dart';
import '../screens/kitchen.dart';
import '../screens/outdoor.dart';
import '../../models/pet_class.dart';
import 'messages.dart';
import '../screens/couple_message.dart';


//first making milo
//first var is just the stats while the second is the widget
var milo = Pet(
  name:"Milo", 
  imagePath: 'assets/images/MainDog-Picsart-BackgroundRemover.png'
);

//pet widgets
var miloWidget = PetWidget(
  name: "Milo", 
  imagepath: 'assets/images/MainDog-Picsart-BackgroundRemover.png',
  pet: milo
);



//widgets around the pet to be redirected
var kitchenDir = WidgetRedirecter(
  imagepath: "assets/images/kitchenIcon.png",
  popup: (context) => const Kitchen(),
);

var outdoorDir = WidgetRedirecter(
  imagepath: "assets/images/outoor_icon.png",
  popup: (context) => const Outdoor(),
);

var messagesDir = WidgetRedirecter(
  imagepath: 'assets/images/message-icon.png',
  popup: (context) => const MessagesDashboard()
);