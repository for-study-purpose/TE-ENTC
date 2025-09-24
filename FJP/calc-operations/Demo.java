import java.util.Scanner;
import component.Calculator;

public class Demo {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        System.out.print("Enter value of a: ");
        int a = scn.nextInt();

        System.out.print("\nEnter value of b: ");
        int b = scn.nextInt();

        Calculator calc = new Calculator();
        int ans = calc.add(a, b);
        System.out.println("Addition is: " + ans);
    }
}