import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.Graphics;
import java.awt.Color;

class DrawShapes extends JPanel {

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        g.setColor(Color.BLACK);
        g.drawRect(10, 10, 150, 100);

        g.setColor(Color.BLACK);
        g.drawOval(10, 120, 150, 100);

        g.setColor(Color.BLACK);
        g.drawLine(180, 10, 280, 110);
    
        g.setColor(Color.BLACK);
        g.drawString("Hello Graphics!", 50, 240);
    }


    public static void main(String[] args) {
        JFrame frame = new JFrame("Draw Shapes Example");

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 300);
        frame.add(new DrawShapes());
        frame.setLocationRelativeTo(null); 
        frame.setVisible(true);
    }
}
