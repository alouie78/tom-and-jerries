class Cat{
  PVector location;
  String imageName;
  int currentScore;
  
  Cat(PVector location, String imageName){
    this.location = location;
    this.imageName = imageName;
    this.currentScore = 0;
  }
  
  void move(int direction){
    if(direction == 1){
      location.x = location.x - 30;
      if(location.x<=0){
        location.x=0;
      }
    }
    else if(direction == 2){
      location.x = location.x + 30;
      if(location.x>=width-90){
        location.x=width-90;
      }
    }
    else if(direction == 3){
      location.y = location.y - 30;
      if(location.y<=0){
        location.y=0;
      }
    }
    else if(direction == 4){
      location.y = location.y + 30;
      if(location.y>=height-90){
        location.y=height-90;
      }
    }
  }
  
  PVector getLocation(){
    return location;
  }
  
  void changeLocation(int x, int y){
    location.x = x;
    location.y = y;
  }
  
  int getCurrentScore(){
    return currentScore;
  }
  
  void addPoints(int points){
    currentScore += points;
  }
  
  void resetScore(){
    currentScore = 0;
  }
  
  void display(){
    PImage cat = loadImage(imageName);
    cat.resize(90,90);
    image(cat, location.x, location.y);
  }
}
