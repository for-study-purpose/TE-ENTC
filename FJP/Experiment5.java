import java.util.Scanner;

public class Experiment5 {

    public static int[][] getMatrix(int row, int column) {
        int[][] matrix = new int[row][column];

        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                matrix[i][j] = (int)(Math.random()*10);
            }
        }
        return matrix;
    }

    public static int[][] addMatrices(int[][] matrix1, int[][] matrix2) {
        int m = matrix1.length;
        int n = matrix1[0].length;

        int[][] matrix = new int[m][n];

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = matrix1[i][j] + matrix2[i][j];
            }
        }

        return matrix;
    }

    public static void displayMatrix(int[][] matrix) {
        
        for (int i = 0; i < matrix.length; i++) {
            for (int j = 0; j < matrix[0].length; j++) {
                System.out.print(matrix[i][j] + "  ");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);

        System.out.println("----Enter Dimensions of Both The Matrices----");

        System.out.print("Enter Size of the row: ");
        int rowSize = scn.nextInt();

        System.out.print("Enter Size of the Column: ");
        int columnSize = scn.nextInt();

        int[][] matrix1 = getMatrix(rowSize, columnSize);
        int[][] matrix2 = getMatrix(rowSize, columnSize);
        int[][] addedMatrix = addMatrices(matrix1, matrix2);

        System.out.println("\nThe Matrix1 is : ");
        displayMatrix(matrix1);

        System.out.println("\nThe Matrix2 is : ");
        displayMatrix(matrix2);

        System.out.println("\nThe Added Matrix is : ");
        displayMatrix(addedMatrix);
    }
}