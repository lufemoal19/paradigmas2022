package fibonacci;

public class Source{

    // static int fibonacciRec(int n){
    //     if (n <= 1)
    //         return n;
    //     return fibonacciRec(n - 1) + fibonacciRec(n - 2);
    // }

    static int fibonacciRec(int n){
        return n <= 1 ? n : fibonacciRec(n - 1) + fibonacciRec(n - 2);
    }

    static double fibonacciForm(int n){
        return ((Math.pow(1 + Math.sqrt(5), n) - Math.pow(1 - Math.sqrt(5), n)) 
                            / (Math.pow(2, n) * Math.sqrt(5)));
    }

    static int fibonacciFor(int n){
        if (n <= 1)
            return n;
        int fib = 1;
        int prev = 1;

        for(int i = 2; i < n; i++){
            int temp = fib;
            fib += prev;
            prev = temp;;
        }
        return fib;
    }

    static int fibonacciWhile(int n){
        if (n <= 1)
            return n;
        int fib = 1;
        int prev = 1;
        int i = 2;
        while(i < n){
            int temp = fib;
            fib += prev;
            prev = temp;
            i++;
        }
        return fib;
    }

    public static void main(String... args){
        int n = Integer.parseInt(args[0]);
        System.out.printf("Number %d\t Fibonacci Rec %d\n", n, fibonacciRec(n));
        System.out.printf("Number %d\t Fibonacci Form %f\n", n, fibonacciForm(n));
        System.out.printf("Number %d\t Fibonacci For %d\n", n, fibonacciFor(n));
        System.out.printf("Number %d\t Fibonacci While %d\n", n, fibonacciWhile(n));
    }
}