package emu.m6502;

import java.util.concurrent.Executors;

import emu.m6502.cpu.memory.RAM;
import emu.m6502.cpu.processing.Command;
import emu.m6502.cpu.processing.Instruction;

public class Main {

	public static void main(String[] args) {

		RAM.memoryMap.add(new Command(Instruction.ADC, 0x0000));
		RAM.memoryMap.add(new Command(Instruction.ADC, 0x0001));
		RAM.memoryMap.add(new Command(Instruction.ADC, 0x0002));
		RAM.memoryMap.add(new Command(Instruction.ADC, 0x0003));

		Executors.newCachedThreadPool().execute(new Runner(1000L));
	}
}
