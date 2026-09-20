class Furniture{
  PVector corner;
  String imageName;
  int Height,Width;

  Furniture(PVector corner, String imageName, int Height, int Width){
    this.corner = corner;
    this.imageName = imageName;
    this.Height = Height;
    this.Width = Width;
  }
  
  PVector getCorner(){
    return corner;
  }
  
  int getHeight(){
    return Height;
  }
  
  int getWidth(){
    return Width;
  }
  
  void display(){
    PImage furniture = loadImage(imageName);
    furniture.resize(Width, Height);
    image(furniture, corner.x, corner.y);
  }
}
