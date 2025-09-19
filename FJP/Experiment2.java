import java.util.Scanner;

public class Experiment2 {

    public static double calculate(double a, double b, char op) {
        switch (op) {
            case '+': 
                return a + b;
            case '-': 
                return a - b;
            case '*': 
                return a * b;
            case '/': 
                if (b == 0) {
                    System.out.println("Undefined (cannot divide by zero)");
                    return Double.NaN; // Return NaN to indicate an error
                }
                return a / b;
            case '%': 
                return a % b;
            default: 
                System.out.println("Invalid operation");
                return Double.NaN; // Return NaN for invalid operation
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        char continueChoice;

        do {
            // Get input from the user
            System.out.print("Enter first number: ");
            double a = sc.nextDouble();
            System.out.print("Enter second number: ");
            double b = sc.nextDouble();
            System.out.print("Enter operator (+ - * / %): ");
            char op = sc.next().charAt(0);

            // Perform the calculation
            double result = calculate(a, b, op);

            // Check for valid result
            if (!Double.isNaN(result)) {
                System.out.println("Result = " + result);
            } else {
                System.out.println("Error in calculation.");
            }

            // Ask the user if they want to continue or exit
            System.out.print("Do you want to continue? (Y/N): ");
            continueChoice = sc.next().toUpperCase().charAt(0);

        } while (continueChoice == 'Y'); // Loop if the user presses 'Y'

        System.out.println("Thank you for using the calculator! Goodbye.");
        sc.close();
    }
}
