import '../../models/pet_class.dart';


//first making milo
//first var is just the stats while the second is the widget
var milo = Pet(name:"Milo", imagePath: 'assets/images/MainDog-Picsart-BackgroundRemover.png');
var miloWidget = PetWidget(
                  name: "Milo", 
                  imagepath: 'assets/images/MainDog-Picsart-BackgroundRemover.png',
                  pet: milo
                  );
