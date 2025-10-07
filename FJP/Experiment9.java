public class Experiment9 {
    public static void main(String[] args) {
        int a = 10;
        int b = 5;
        int c = 5;
        
        try {
            int x = a/(b-c);
            System.out.println("Division: " + x);
        } catch (ArithmeticException e) {
            System.out.println("Can not peform operation due to invalid attempts. (Check Denominator): " + e);
        } catch (Exception e) {
            System.out.println("Unknown error");
        }
    }
}
