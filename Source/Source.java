package practica_javap_0;

public class Source{

    public static int factorialRec(int n){
        return n <= 1 ? n : n * factorialRec(n - 1);
    }

    public static int factorialIter(int n){
        for (int i = n - 1; i >= 1; i--)
            n *= i;
        return n;
    }
   
    public static int factorialWhile(int n){
        int i = n - 1;
        while (i >= 1){
            n *= i;
            --i;
        }
        return n;
    }

    public static void main(String[] args){
        System.out.print("FACTORIAL CALCULATOR\n");

        int n = Integer.parseInt(args[0]);

        if (n > 0 && n <= 10){
            System.out.printf("Numero: %d Factorial Recursivo:\t %d\n",
            n, factorialRec(n));

            System.out.printf("Numero: %d Factorial Iterativo:\t %d\n",
            n, factorialIter(n));

            System.out.printf("Numero: %d Factorial While:\t %d\n",
            n, factorialWhile(n));
        }
        else{
            System.err.println("ERROR: El numero debe ser positivo y menor a 10");
        }
    }
}