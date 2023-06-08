import java.util.Scanner;

public class BinaryMath extends NumberConverter {

	public static void main(String[] args) {
		System.out.println("A. Binary Addition.");
		System.out.println("B. Binary Subtraction.");
		System.out.println("C. Binary Multiplication.");
		System.out.println("D. Binary Division.");
		
		System.out.println();
		System.out.print("Please select a letter: ");
		
		Scanner in = new Scanner(System.in);
		String str = in.next();

		while(!(str.equalsIgnoreCase("A") || str.equalsIgnoreCase("B") || str.equalsIgnoreCase("C") || str.equalsIgnoreCase("D")))
		{
			System.out.print("Please enter a valid letter option: ");
			str = in.next();
		}
		
		int num1 = 0;
		int num2 = 0;
		
		if(str.equalsIgnoreCase("A"))
		{
			System.out.print("Enter first number: ");
			num1 = in.nextInt();
			System.out.print("Enter second number: ");
			num2 = in.nextInt();
			System.out.println("The solution is " + add(num1, num2) + ".");
		}
			
		else if(str.equalsIgnoreCase("B"))
		{
			System.out.print("Enter first number: ");
			num1 = in.nextInt();
			System.out.print("Enter second number: ");
			num2 = in.nextInt();
			System.out.println("The solution is " + sub(num1, num2) + ".");
		}
		
		else if(str.equalsIgnoreCase("C"))
		{
			System.out.print("Enter first number: ");
			num1 = in.nextInt();
			System.out.print("Enter second number: ");
			num2 = in.nextInt();
			System.out.println("The solution is " + mult(num1, num2) + ".");
		}
		
		else if(str.equalsIgnoreCase("D"))
		{
			System.out.print("Enter first number: ");
			num1 = in.nextInt();
			System.out.print("Enter second number: ");
			num2 = in.nextInt();
			System.out.println("The solution is " + div(num1, num2) + ".");
		}
		in.close();
	}
	
	public static int add(int num1, int num2)
	{
		return toBinary(toDecimal(num1) + toDecimal(num2));
	}
	
	public static int sub(int num1, int num2)
	{
		return toBinary(toDecimal(num1) - toDecimal(num2));
	}
	
	public static int mult(int num1, int num2)
	{
		return toBinary(toDecimal(num1) * toDecimal(num2));
	}
	
	public static int div(int num1, int num2)
	{
		return toBinary(toDecimal(num1) / toDecimal(num2));
	}
}
