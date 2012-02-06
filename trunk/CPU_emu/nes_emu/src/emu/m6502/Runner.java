package emu.m6502;

import emu.m6502.cpu.memory.RAM;
import emu.m6502.cpu.processing.Command;
import emu.m6502.cpu.processing.Instruction;

/**
 * 
 * 
 * @author Tommy.Wang
 * 
 */
public class Runner implements Runnable {

	private long millis = 1000L;

	public Runner(long millis) {
		super();
		this.millis = millis;
	}

	@Override
	public void run() {
		// TODO
		Command c = new Command(Instruction.ADC, 0x0001);
		for (;;) {
			c = RAM.memoryMap.poll();
			if (null == c) {
				break;
			}
			System.out.println(c.getInstruction() + "\t:\t" + c.getOperand());

			try {
				Thread.sleep(millis);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
