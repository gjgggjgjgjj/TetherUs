class Pet {
  double hunger; // 0 = full, 100 = starving

  Pet({this.hunger = 50});

  void feed() {
    hunger -= 10;
    if (hunger < 0) hunger = 0;
  }

  void tick() {
    hunger += 0.5;
    if (hunger > 100) hunger = 100;
  }
} 