import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class A02a{
	public static void main(String[] args) {
		BufferedReader br = null;
		String line;
		String[] numbers;
		int sum = 0;
		int min, max, tmp;

        try {
            br = new BufferedReader(new FileReader(args[0]));

            while ((line = br.readLine()) != null) {
            	numbers = line.split("\\s+");
            	min = max = Integer.parseInt(numbers[0]);
            	for (String numb : numbers)
            	{
            		tmp = Integer.parseInt(numb);
            		if (max < tmp) max = tmp;
            		if (min > tmp) min = tmp;
            	}
            	sum += max - min;
            }
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	System.out.println(sum);
        	br.close();
        }
	}
}