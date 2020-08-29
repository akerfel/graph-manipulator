public class Node {
    public int x;
    public int y;
    public int id;
    public boolean inFocus;
    
    Node(int id, int x, int y) {
        this.id = id;
        this.x = x;
        this.y = y;
        inFocus = false;
    }
}
