/*
 * util.c
 *
 * Ullrich von Bassewitz, 18.06.1998
 */



#include "util.h"



/*****************************************************************************/
/*		     		     data				     */
/*****************************************************************************/






/*****************************************************************************/
/*		     	   	     code				     */
/*****************************************************************************/



int powerof2 (unsigned long val)
/* Return the exponent if val is a power of two. Return -1 if val is not a
 * power of two.
 */
{
    int i;
    unsigned long mask;
    mask = 0x0001;

    for (i = 0; i < 32; ++i) {
	if (val == mask) {
	    return i;
	}
	mask <<= 1;
    }
    return -1;
}



