#
# copyright

//#include "os_service.h"

.globl _start
_start:
	add a6,a0,5
	call os_service_init
