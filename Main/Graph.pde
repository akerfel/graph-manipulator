import java.util.HashSet;

public class Graph {
    HashMap<Integer, Node> nodes;
    HashMap<Integer, Integer> edges;
    
    Graph() {
        nodes = new HashMap<Integer, Node>();    
        edges = new HashMap<Integer, Integer>();
    }
    
    void addNode(int id, int x, int y) {
        nodes.put(id, new Node(id, x, y));    
    }
    
    void addEdge(int id1, int id2) {
        if (nodes.keySet().contains(id1) && nodes.keySet().contains(id2)) {
            edges.put(id1, id2);
        }
    }
    
    Node getNode(int id) {
        return nodes.get(id);    
    }
}
