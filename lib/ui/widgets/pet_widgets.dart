import 'package:TetherUs/models/redirecter.dart';
import '../screens/kitchen.dart';
import '../../models/pet_class.dart';


//first making milo
//first var is just the stats while the second is the widget
var milo = Pet(
  name:"Milo", 
  imagePath: 'assets/images/MainDog-Picsart-BackgroundRemover.png'
);

var miloWidget = PetWidget(
  name: "Milo", 
  imagepath: 'assets/images/MainDog-Picsart-BackgroundRemover.png',
  pet: milo
);


//widgets around the pet to be redirected
var kitchenDir = Redirecter(
  imagepath: "assets/images/kitchenIcon.png",
  screen: (context) => const Kitchen(),
);
