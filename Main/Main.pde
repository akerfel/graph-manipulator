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

void moveGrabbedNode() {
    if (grabbedNode != null) {
        grabbedNode.x = mouseX;
        grabbedNode.y = mouseY;
    }
}

void drawHelpText() {
    textAlign(CORNER, CORNER);
    fill(0);
    textSize(12);
    text("press x -> new node", 0, 10);    
}

void keyPressed() {
    if (key == 'x') {
        createNode(int(mouseX), int(mouseY));
    }
}

void createNode(int x, int y) {
    graph.addNode(counter, mouseX, mouseY);
    counter++;    
}

void mouseReleased() {
    if (mouseButton == LEFT) {
        grabbedNode = null;
    }
}

void mousePressed() {
    if (mouseButton == LEFT) {
        for (Node node : graph.nodes.values()) {
            if (dist(mouseX, mouseY, node.x, node.y) <= nodeRadius) {
                grabbedNode = node;
            }
        }
    }
    
    if (mouseButton == RIGHT) {
        for (Node node : graph.nodes.values()) {
            if (dist(mouseX, mouseY, node.x, node.y) <= nodeRadius) {
                println("hit");
                if (focusedNode != null) {
                    graph.addEdge(node.id, focusedNode.id);
                    focusedNode = null;
                }
                else {
                    focusedNode = node;
                }
                break;
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
    if (node == focusedNode) {
        fill(175,238,238);
    }
    else {
        fill(255);
    }
    circle(node.x, node.y, nodeRadius * 2);  
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
