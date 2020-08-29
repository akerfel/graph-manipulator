Graph graph;
int counter;

void setup() {
    size(800, 800);
    graph = new Graph();
    counter = 1;
}

void draw() {
    background(0);
    drawGraph();
}

void mousePressed() {
    if (mouseButton == RIGHT) {
        graph.addNode(counter, mouseX, mouseY);
        counter++;
    }
}

void drawGraph() {
    for (Node node : graph.nodes.values()) {
        drawNode(node);    
    }
}

void drawNode(Node node) {
    fill(255);
    circle(node.x, node.y, 40);  
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(node.id, node.x, node.y);
}
