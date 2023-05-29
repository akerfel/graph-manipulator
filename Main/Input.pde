void keyPressed() {
    if (key == 'x') {
        createNode(int(mouseX), int(mouseY));
    }
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
                if (focusedNode != null) {
                    graph.addEdge(node.id, focusedNode.id);
                    focusedNode = null;
                } else {
                    focusedNode = node;
                }
                break;
            }
        }
    }
}
