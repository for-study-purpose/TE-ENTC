
import java.util.Scanner;
public class Experiment4 {
   public static void main(String args[]){
        Scanner sc =new Scanner(System.in);
        System.out.print("enter a =");
        double a=sc.nextDouble();
        System.out.print("enter b =");
        double b=sc.nextDouble();
        // constructor overloading
        System.out.print("constructor overloaded answer =");
        Overloading o=new Overloading(a,b);
        // method overloading
        System.out.print("method overloaded answer ="+ Overloading.substract(a, b));
        

        sc.close();
   }
}

 class Overloading {
    Overloading(int a,int b){
        System.out.println("substract is is ="+ (a-b));
    }
     Overloading(double a,double b){
        System.out.println("substract is is ="+ (a-b));
    }

    public static int  substract(int a,int b){
        return a-b;
    }
    public static double substract(double a,double b){
        return a-b;
    }
}












