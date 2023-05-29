import java.util.HashSet;

public class Graph {
    HashMap<Integer, Node> nodes;
    ArrayList<Edge> edges;

    Graph() {
        nodes = new HashMap<Integer, Node>();
        edges = new ArrayList<Edge>();
    }

    void addNode(int id, int x, int y) {
        nodes.put(id, new Node(id, x, y));
    }

    void addEdge(int id1, int id2) {
        if (id1 != id2 && nodes.keySet().contains(id1) && nodes.keySet().contains(id2)) {
            edges.add(new Edge(id1, id2));
            println("Added edge: " + id1 + "-" + id2);
        }
    }

    Node getNode(int id) {
        return nodes.get(id);
    }
}
