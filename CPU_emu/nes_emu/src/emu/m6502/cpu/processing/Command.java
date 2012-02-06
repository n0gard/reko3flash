package emu.m6502.cpu.processing;

/**
 * ��������
 * 
 * @author Tommy.Wang
 * 
 */
public class Command {
	/**
	 * ָ��
	 */
	private Instruction instruction;

	/**
	 * ������
	 */
	private int operand;

	/**
	 * �������� ����"������"��"������"
	 * 
	 * @param instruction
	 * @param operand
	 */
	public Command(Instruction instruction, int operand) {
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

	public int getOperand() {
		return operand;
	}

	public void setOperand(int operand) {
		this.operand = operand;
	}

}
