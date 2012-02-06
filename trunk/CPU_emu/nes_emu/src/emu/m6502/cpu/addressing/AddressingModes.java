package emu.m6502.cpu.addressing;

/**
 * 寻址模式
 * @author Administrator
 *
 */
public enum AddressingModes {
	/**
	 * 快速模式
	 * 
	 * 在这种模式中，操作数的值在指令中被给出. 在汇编语言中，这种模式以操作数前加 "#" 来标记.<br>
	 * 例如: LDA #$0A - 意思是 "load the accumulator with the hex value 0A"<br>
	 * 在机器代码中，不同的模式以不同的代码标记. 所以 LDA 将依赖于不同的地址模式被翻译成不同的代码. 在这种<br>
	 * 模式中，代码是: $A9 $0A<br>
	 */
	Immediate,

	/**
	 * 完全和完全零页面模式<br>
	 * 在这种模式中，操作数地址被给出. <br>
	 * 例如: LDA $31F6 - (汇编语言) <br>
	 * $AD $31F6 - (机器代码) <br>
	 * 如果地址不是在零页面 - 也就是，任何高字节不是00的地址 - 只有一个字节需要给出. 处理器自动将高字节填为00.<br>
	 * 例如: LDA $F4 <br>
	 * $A5 $F4 <br>
	 * 注意不同的模式中不同的指令代码. <br>
	 * 同时注意对于两字节地址，低字节先被储存，例如: LDA $31F6 在内存中被存为三个字节: $AD $F6 $31.
	 * 绝对零页面通常被叫做零页面.
	 */
	Absolute,

}
