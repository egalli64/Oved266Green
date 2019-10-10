package exercize;

public class PerfectNumber {
	public static void main(String[] args) {
		System.out.println(checkPerfectNumber(3));
	}

	public static PerfectConst checkPerfectNumber(int number) {
		if (number == 0) {
			return PerfectConst.DIFECTIVE;
		} else if (number < 0) {
			throw new IllegalArgumentException("The number is negative");
		}
		int divisorSummation = 0;
		int numberCopy = number / 2;
		while (numberCopy != 0) {
			if ((number % numberCopy) == 0) {
				divisorSummation += numberCopy;
				numberCopy--;
			} else {
				numberCopy--;
			}
		}

		if (divisorSummation == number) {
			return PerfectConst.PERFECT;
		}
		if (divisorSummation < number) {
			return PerfectConst.DIFECTIVE;
		} else {
			return PerfectConst.ABUNDANT;
		}
	}
}
