package emu.m6502.cpu.memory;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

import emu.m6502.cpu.processing.Command;

/**
 * �ڴ� ����
 * 
 * @author Tommy.Wang
 * 
 */
public class RAM {
	public static Queue<Command> memoryMap = new ConcurrentLinkedQueue<Command>();
}
