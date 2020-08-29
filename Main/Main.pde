Graph graph;
int counter;
int nodeRadius;
Node focusedNode;
Node grabbedNode;

void setup() {
    size(800, 800);
    graph = new Graph();
    counter = 1;
    nodeRadius = 20;
    focusedNode = null;
}

void draw() {
    background(150);
    moveGrabbedNode();
    drawHelpText();
    drawGraph();
}
