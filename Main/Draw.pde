void drawGraph() {
    drawEdges();
    drawNodes();
}

void drawHelpText() {
    textAlign(CORNER, CORNER);
    fill(0);
    textSize(12);
    text("add node: x", 0, 10);    
    text("drag nodes: LMB", 0, 24);    
    text("add edge: RMB", 0, 36);    
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
        circle(node.x, node.y, nodeRadius * 2.5);  
    }
    fill(node.c);
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
