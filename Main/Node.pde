public class Node {
    public int x;
    public int y;
    public int id;
    public color c;

    Node(int id, int x, int y) {
        this.id = id;
        this.x = x;
        this.y = y;
        c = color(random(0, 255), random(0, 255), random(0, 255));
    }
}
