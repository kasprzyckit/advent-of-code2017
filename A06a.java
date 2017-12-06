import java.io.*;
import java.util.*;

public class A06a{
	public static void main(String[] args) {
		BufferedReader br = null;
		String line;
        Integer[] numbs;
        int val, j;
        int count = 0;
        Hashtable<Integer, Boolean> hast = new Hashtable<>();
        try {
            br = new BufferedReader(new FileReader(args[0]));

            if ((line = br.readLine()) != null) {
                String[] numbers = line.split("\\s+");
                numbs = new Integer[numbers.length];
            	for (int i = 0; i<numbers.length; i++)
                {
                    numbs[i] = Integer.parseInt(numbers[i]);
                }    
            }
            else return;
            System.out.println("0: ");
            for (int i = 0; i<numbs.length; i++) System.out.print(numbs[i] + ", ");
            System.out.println("");
            while (!hast.containsKey(hash(numbs)))
            {
                hast.put(hash(numbs), true);
                j = max(numbs);
                val = numbs[j];
                numbs[j] = 0;
                while (val > 0)
                {
                    if (++j >= numbs.length) j = 0;
                    numbs[j] += 1;
                    val--;
                }
                System.out.println(++count + ": ");
                for (int i = 0; i<numbs.length; i++) System.out.print(numbs[i] + ", ");
                System.out.println("");
            }
            System.out.println("\n" + count);

        } catch (IOException e) {
        	e.printStackTrace();
        } finally {
        	if (br != null) try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
	}

    public static int max(Integer[] numbers)
    {
        int max = 0;
        for (int i = 1; i<numbers.length; i++)
            if (numbers[i] > numbers[max]) max = i;
        return max;
    }
    public static Integer hash(Integer[] numbers)
    {
        return Arrays.deepHashCode(numbers);
    }
}