#include <iostream>
#include <math.h>
void access2(int x, double y, double z) {
	double xmm6, xmm7, xmm8 = 0;
	xmm7 = pow(x, 2);
	xmm6 = sin(y);
	xmm6 += log10(z);
	if (xmm6 > xmm7) {
		printf_s("Access granted");
		return;
	}
	printf_s("Access denied");
}
