import java.lang.Math;
public class CalcPercent {
    public static double calculate(int passed, int total) {
        return ((double) passed)/((double) total);
    }
    public static void main(String[] args) {
        System.out.println(Math.round(100*calculate(Integer.parseInt(args[0]), Integer.parseInt(args[1]))));
    }
}