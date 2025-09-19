import java.util.Scanner;

class Rectangle {
    private double length, width;
    private String colour;

    Rectangle(double length, double width, String colour) {
        this.length = length;
        this.width = width;
        this.colour = colour;
    }

    public double getLength() { return length; }
    public double getWidth() { return width; }
    public String getColour() { return colour.toLowerCase(); }
    public double findArea() { return length * width; }
}

public class Experiment3 {

    public static void compareRectangles(Rectangle r1, Rectangle r2) {
        if (r1.findArea() == r2.findArea() && r1.getColour().equals(r2.getColour())) {
            System.out.println("Matching Rectangle");
        } else {
            System.out.println("Non-matching Rectangle");
        }
    }
    public static void main(String[] args) {
        System.out.println("write height and length of rectangle 1");
        Scanner sc=new Scanner(System.in);
        System.out.print("length of rectangle 1 is =");
        double a=sc.nextDouble();
        System.out.print("breath of rectangle 1 is =");
        double b =sc.nextDouble();
        System.out.print("color of rectangle 1 is =");
        String c =sc.next().toLowerCase();
        System.out.print("length of rectangle 2 is =");
        double d=sc.nextDouble();
        System.out.print("breath of rectangle 2 is =");
        double e =sc.nextDouble();
        System.out.print("color of rectangle 2 is =");
        String f =sc.next().toLowerCase();


        Rectangle rect1 = new Rectangle(a, b, c);
        Rectangle rect2 = new Rectangle(d, e, f);
        

        compareRectangles(rect1, rect2);
        sc.close();
    }
}

