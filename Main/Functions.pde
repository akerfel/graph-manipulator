void moveGrabbedNode() {
    if (grabbedNode != null) {
        grabbedNode.x = mouseX;
        grabbedNode.y = mouseY;
    }
}

void createNode(int x, int y) {
    graph.addNode(counter, x, y);
    counter++;    
}
