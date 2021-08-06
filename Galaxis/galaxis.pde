Mover mover;
float speed;
ArrayList<Mover> movers = new ArrayList<Mover>();

void setup() {
  size (600, 600);
  speed = 5;
}

//Update()
void draw() {
  background(0);
  //update all movers
  if(movers.size() > 0)
  {    
    for (int i = 0; i < movers.size(); i++) {
      Mover mover = movers.get(i);
   
      mover.move();
      //mover.checkEdges();
      mover.display();
    }
  }
}

void mouseClicked(){
    movers.add(new Mover(new PVector(mouseX, mouseY), new PVector (width/2, height/2), speed));
}

class Mover {
  PVector location;
  PVector destination;
  float speed;
  
  Mover (PVector location, PVector destination, float speed){
    this.location = location;
    this.destination = destination;
    this.speed = speed;
  }

  void move(){
      if(!atDestination()) {
        PVector dir = PVector.sub(this.destination, this.location);
        dir.normalize();
        this.location = this.location.add(dir.mult(speed));
        return;
      }
      this.destination = newDestination(); 
  }  


  //new random destination
  PVector newDestination(){
    return new PVector(random(width), random(height));
  }

  void display(){
    stroke(0);
    fill(255);
    ellipse(this.location.x, this.location.y, 4, 4);
  }
  
  boolean atDestination(){
    Float dis = this.location.dist(this.destination);
    if (dis < 5) {
       return true;
    }
    return false;
  } 
  
  void checkEdges(){
          
    if(this.location.x > width) {
      this.location.x = 0;}
     else if (this.location.x < 0) {
       this.location.x = width;
     };
     
    if(this.location.y > height) {
      this.location.y = 0;}
     else if (this.location.y < 0) {
       this.location.x = height;
     };
  }
}
