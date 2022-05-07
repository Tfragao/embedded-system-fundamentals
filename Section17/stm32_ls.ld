ENTRY(Reset_handler)
MEMORY
{
	FLASH(rx): ORIGIN =0x08000000, LENGTH =512K
	SRAM(rwx):ORIGIN =0x20000000,  LENGTH =128K
	
}

SECTIONS
{
	.text :
	{
		*(.isr_vector)
		*(.text) 
		*(.text.*)
		*(.init)
		*(.fini)
		*(.rodata)
		*(.rodata.*)
		_etext = .;
	}> FLASH AT> FLASH
	
	_la_data = LOADADDR(.data);
	
	.data : 
	{
		_sdata = .;
		*(.data)
		*(.data.*)
		_edata = .;
	}> SRAM AT> FLASH
	
	.bss :
	{
		_sbss = .;
		__bss_start__ = _sbss;
		*(.bss)
		*(.bss.*)
		_ebss = .;
		__bss_end__ = _ebss;
		. = ALIGN(4);
		end = .;
		__end__ = .;
	}> SRAM AT> SRAM
	

}