import java.util.Scanner;

public class Experiment1 {

    public static long factorial(int n) {
        long fact = 1;
        for (int i = 1; i <= n; i++) {
            fact *= i;
        }
        return fact;
    }

   
    public static void displayPrimes(int limit) {
        int count = 0, num = 2;
        while (count < limit) {
            boolean isPrime = true;
            for (int i = 2; i <= Math.sqrt(num); i++) {
                if (num % i == 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                System.out.print(num + " ");
                count++;
            }
            num++;
        }
        System.out.println();
    }

  
public static void sumAndAverage(int num) {
    int sum = 0, count = 0, temp = num;

    while (temp > 0) {
        sum =sum+ (temp % 10); 
        temp =temp/ 10;       
        count++;
    }

    double avg = (double) sum / count;

    System.out.println("Sum = " + sum);
    System.out.println("Average = " + avg);
}


    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

      
        System.out.print("number for factorial: ");
        int num = sc.nextInt();
        System.out.println("Factorial = " + factorial(num));

        
        System.out.println("50 prime numbers:");
        displayPrimes(50);
        System.out.println("enter the number for average");
        int b=sc.nextInt();
        sumAndAverage(b);
        sc.close();
    }
}
