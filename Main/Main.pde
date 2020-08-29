Graph graph;
int counter;
int nodeRadius;
Node focusedNode;

void setup() {
    size(800, 800);
    graph = new Graph();
    counter = 1;
    nodeRadius = 40;
    focusedNode = null;
}

void draw() {
    background(150);
    drawGraph();
}

void mousePressed() {
    if (mouseButton == RIGHT) {
        graph.addNode(counter, mouseX, mouseY);
        counter++;
    }
    if (mouseButton == LEFT) {
        for (Node node : graph.nodes.values()) {
            if (dist(mouseX, mouseY, node.x, node.y) <= nodeRadius) {
                if (focusedNode != null) {
                    graph.addEdge(node.id, focusedNode.id);
                    focusedNode.inFocus = false;
                    focusedNode = null;
                }
                else {
                    node.inFocus = true;
                    focusedNode = node;
                }
            }
        }
    }
}

void drawGraph() {
    drawEdges();
    drawNodes();
}

void drawEdges() {
    for (Edge edge : graph.edges) {
        drawEdge(edge);
    }    
}

void drawNodes() {
    for (Node node : graph.nodes.values()) {
        drawNode(node);    
    }
}

void drawNode(Node node) {
    stroke(0);
    if (node.inFocus) {
        fill(175,238,238);
    }
    else {
        fill(255);
    }
    circle(node.x, node.y, nodeRadius);  
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(node.id, node.x, node.y);
}

void drawEdge(Edge edge) {
    stroke(255);
    Node node1 = graph.getNode(edge.id1);
    Node node2 = graph.getNode(edge.id2);
    line(node1.x, node1.y, node2.x, node2.y);
}
