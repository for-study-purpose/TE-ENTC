interface Area {
    double PI = 3.14159265;
    double compute(double length, double width);
}

class Rectangle implements Area {
    @Override
    public double compute(double length, double width) {
        return length * width;
    }
}

class Circle implements Area {
    @Override
    public double compute(double radius, double ignored) {
        return PI * radius * radius;
    }
}

public class Experiment8 {
    public static void main(String[] args) {
        Area rect = new Rectangle();
        System.out.println("Area of Rectangle: " + rect.compute(9.36, 9.36));

        Area circ = new Circle();
        System.out.println("Area of Circle: " + circ.compute(9, 0));
    }
}
