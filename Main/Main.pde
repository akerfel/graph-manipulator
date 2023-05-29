// In this file, all global variables and declared and initialized,
// and the draw() method is defined, which is called 60 times per second.

Graph graph;
int counter;
int nodeRadius;
Node focusedNode;
Node grabbedNode;

// This method is called at startup
void setup() {
    size(800, 800);
    graph = new Graph();
    counter = 1;
    nodeRadius = 20;
    focusedNode = null;
}

// This method is called 60 times per seconds
void draw() {
    background(150);
    moveGrabbedNode();
    drawHelpText();
    drawGraph();
}
