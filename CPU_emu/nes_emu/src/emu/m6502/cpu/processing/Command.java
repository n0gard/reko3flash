package emu.m6502.cpu.processing;

/**
 * 操作命令
 * 
 * @author Tommy.Wang
 * 
 */
public class Command {
	/**
	 * 指令
	 */
	private Instruction instruction;

	/**
	 * 操作数
	 */
	private Object operand;

	/**
	 * 操作命令 包含"操作码"和"操作数"
	 * 
	 * @param instruction
	 * @param operand
	 */
	public Command(Instruction instruction, Object operand) {
		super();
		this.instruction = instruction;
		this.operand = operand;
	}

	// getter & setter
	public Instruction getInstruction() {
		return instruction;
	}

	public void setInstruction(Instruction instruction) {
		this.instruction = instruction;
	}

	public Object getOperand() {
		return operand;
	}

	public void setOperand(Object operand) {
		this.operand = operand;
	}

}
