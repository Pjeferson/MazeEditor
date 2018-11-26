class Cell {
  int x,y,size;
  char type;
  Cell(int x,int y,int size, char type){
    this.x = x;
    this.y = y;
    this.size = size;
    this.type = type;
  }
  void drawn(){
    if (type == '1'){
      fill(0,0,0);
    } else if (type == '2'){
      fill(255,255,0);
    } else if (type == '3'){
      fill(0,0,255);
    } else {
      fill(255,255,255);
    } 
    
    rect(x*size,y*size,size,size);
  }
  
  boolean test(int x, int y, char type){
    if(this.x*this.size < x && x < this.x*this.size+size && this.y*this.size < y && y < this.y*this.size+size){
      this.type = type;
      return true;
    }
    return false;
  }
}
