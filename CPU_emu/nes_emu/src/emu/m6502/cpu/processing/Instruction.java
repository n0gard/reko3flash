package emu.m6502.cpu.processing;

/**
 * ЦёБо
 * 
 * @author Tommy.Wang
 * 
 */
public enum Instruction {
	/**
	 * Add Memory to Accumulator with Carry
	 */
	ADC,
	/**
	 * "AND" Memory with Accumulator
	 */
	AND,
	/**
	 * Shift Left One Bit (Memory or Accumulator)
	 */
	ASL,

	/**
	 * Branch on Carry Clear
	 */
	BCC,

	/**
	 * Branch on Carry Set
	 */
	BCS,

	/**
	 * Branch on Result Zero
	 */
	BEQ,

	/**
	 * Test Bits in Memory with Accumulator
	 */
	BIT,
	/**
	 * Branch on Result Minus
	 */
	BMI,

	/**
	 * Branch on Result not Zero
	 */
	BNE,
	/**
	 * Branch on Result Plus
	 */
	BPL,
	/**
	 * Force Break
	 */
	BRK,
	/**
	 * Branch on Overflow Clear
	 */
	BVC,
	/**
	 * Branch on Overflow Set
	 */
	BVS, ;
}
