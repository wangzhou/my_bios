ENTRY(_start)

SECTIONS
{
	. = 0x80000000;
	_start = .;

	.text :
	{
		*(.text)
	}
}
