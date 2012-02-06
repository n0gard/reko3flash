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
	private Object operand;

	/**
	 * �������� ����"������"��"������"
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
