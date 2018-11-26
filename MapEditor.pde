  

String map[];
ArrayList<Cell> cells;
ArrayList<Button> buttons;
int size, matrixSize;
char type;
char mapchars[][];
void setup(){
  size(640,480);
  size = 20;
  matrixSize= 20;
  type = '1';
  mapchars = new char[matrixSize][matrixSize];
  map = loadStrings("map.txt");
  if (map == null || map.length != matrixSize) {
    map = new String[matrixSize];
    String s = "";
    for(int i =0; i< matrixSize ;i++){
      s+="0";
    }
    for(int i =0; i< matrixSize ;i++){
      map[i] = s;
    }
  }
  for(int i =0; i< matrixSize ;i++){
      mapchars[i]=map[i].toCharArray();
  }
  
  cells = new ArrayList();
  buttons = new ArrayList();
  buttons.add(new Button(22,1,size,'0'));
  buttons.add(new Button(23,1,size,'1'));
  buttons.add(new Button(24,1,size,'2'));
  buttons.add(new Button(25,1,size,'3'));
  
  for(int i =0; i< matrixSize ;i++){
    String s = map[i];
    for(int j =0; j< matrixSize;j++){
      cells.add(new Cell(j,i,size, s.charAt(j)));
    }
  }
  
}
void draw() {
  noStroke();
  for(Cell cell: cells){
    cell.drawn();
  }
  for(Button button: buttons){
    button.drawn();
  }
}

void mouseDragged(MouseEvent event) {
  for(Cell cell: cells){
    if(cell.test(event.getX(), event.getY(), type)){
      mapchars[cell.y][cell.x] = cell.type;    
    }
  }
}
void mouseClicked(MouseEvent event) {
  for(Button button: buttons){
    if(button.test(event.getX(), event.getY())){
      type = button.type;
    }
  }
}
  
void exit() {
  for(int i =0; i< matrixSize ;i++){
    map[i] = String.valueOf(mapchars[i]);
  }
  saveStrings("map.txt", map);
}
