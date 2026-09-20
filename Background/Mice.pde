class Mice{
  PVector location;
  String imageName;
  int appearanceTime;
  boolean visible;
  
  Mice(PVector origin, String referenceImage, int baseTime, boolean visibility){
    location = origin;
    imageName = referenceImage;
    appearanceTime = baseTime;
    visible = visibility;
  }
  
  boolean isVisible(){
    return visible;
  }
  
  void changeVisibility(){
    visible = !visible;
  }
  
  PVector getLocation(){
    return location;
  }
  
  int getTime(){
    return appearanceTime;
  }
  
  void display(){
    if(visible){
      PImage mouse = loadImage(imageName);
      mouse.resize(60,90);
      image(mouse, location.x, location.y);
    }
  }
}
