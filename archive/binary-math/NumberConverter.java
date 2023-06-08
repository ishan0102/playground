import java.util.Scanner;

public class NumberConverter {

	public static void main(String[] args)
	{
		System.out.println("A. Convert from Decimal to Binary.");
		System.out.println("B. Convert from Binary to Decimal.");
		System.out.println();
		System.out.print("Please select a letter: ");
		
		Scanner in = new Scanner(System.in);
		String str = in.next();

		while(!(str.equalsIgnoreCase("A") || str.equalsIgnoreCase("B")))
		{
			System.out.print("Please enter a valid letter option: ");
			str = in.next();
		}
		
		System.out.println();
		System.out.print("Enter the number you would like to convert: ");
		int num = Integer.parseInt(in.next());
		System.out.println();
		
		if(str.equalsIgnoreCase("A"))
			System.out.println("The decimal number " + num + " is " + toBinary(num) + " when converted to binary.");
		else if(str.equalsIgnoreCase("B"))
			System.out.println("The binary number " + num + " is " + toDecimal(num) + " when converted to decimal.");
		in.close();
	}
	
	public static int toBinary(int dec)
	{
		int exp = 0;
		while(dec - (Math.pow(2, exp)) >= 0)
		{
			exp++;
		}
		
		int[] nums = new int[exp];
		for(int i = 0; i < nums.length; i++)
		{
			int sub = (int) Math.pow(2, exp - i - 1);
			if(dec - sub >= 0)
			{
				nums[i] = 1;
				dec -= sub;
			}
		}

		String str = "";
		for(int i = 0; i < nums.length; i++)
		{
			str += nums[i];
		}
		int ret = Integer.parseInt(str);
		return ret;
	}
	
	public static int toDecimal(int bin)
	{
		String str = String.valueOf(bin);
		int len = str.length();
		int dec = 0;
		int ct = 0;
		while(ct < len)
		{
			if(bin % 10 == 1)
				dec += Math.pow(2, ct);
			bin /= 10;
			ct++;
		}
		return dec;
	}
}