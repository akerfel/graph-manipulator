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
    background(0);
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
                    focusedNode = null;
                }
                else {
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
    for (int id1 : graph.edges.keySet()) {
        drawEdge(id1, graph.edges.get(id1));
    }    
}

void drawNodes() {
    for (Node node : graph.nodes.values()) {
        drawNode(node);    
    }
}

void drawNode(Node node) {
    stroke(0);
    fill(255);
    circle(node.x, node.y, nodeRadius);  
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(node.id, node.x, node.y);
}

void drawEdge(int id1, int id2) {
    stroke(255);
    Node node1 = graph.getNode(id1);
    Node node2 = graph.getNode(id2);
    line(node1.x, node1.y, node2.x, node2.y);
}
