package exercize;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;

class PerfectNumberTest {

	@Test
	void testPerfect() {
		PerfectConst actual = PerfectNumber.checkPerfectNumber(28);
		
		assertThat(actual, is(PerfectConst.PERFECT));
	}
	
	@Test
	void testDifective() {
		PerfectConst actual = PerfectNumber.checkPerfectNumber(1);
		
		assertThat(actual, is(PerfectConst.DIFECTIVE));
	}
	
	@Test
	void testZero() {
		PerfectConst actual = PerfectNumber.checkPerfectNumber(0);
		
		assertThat(actual, is(PerfectConst.DIFECTIVE));
	}
	
	@Test
	void testNegative() {
		IllegalArgumentException exc = assertThrows(IllegalArgumentException.class, () -> PerfectNumber.checkPerfectNumber(-5));
		
		assertThat(exc.getMessage(), is("The number is negative"));
	}
	
//	@Test
//	void testAbundant() {
//		PerfectConst actual = PerfectNumber.checkPerfectNumber(28); //devo trovare un numero abbondante
//		
//		assertThat(actual, is(PerfectConst.ABUNDANT));
//	}
}
