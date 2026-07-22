void
fibonacci(Monitor *mon, int s) {
	unsigned int i, n, nx, ny, nw, nh;
	Client *c;
	int oe = enablegaps, ie = enablegaps;

	for(n = 0, c = nexttiled(mon->clients); c; c = nexttiled(c->next), n++);
	if(n == 0)
		return;

	if (smartgaps == (int)n)
		oe = 0; // outer gaps disabled when only one client

	nx = mon->wx + mon->gappov*oe;
	ny = 0;
	nw = mon->ww - 2*mon->gappov*oe;
	nh = mon->wh - 2*mon->gappoh*oe;

	for(i = 0, c = nexttiled(mon->clients); c; c = nexttiled(c->next)) {
		if((i % 2 && nh / 2 > 2 * c->bw)
		  || (!(i % 2) && nw / 2 > 2 * c->bw)) {
			if(i < n - 1) {
				if(i % 2)
					nh = (nh - mon->gappih*ie) / 2;
				else
					nw = (nw - mon->gappiv*ie) / 2;
				if((i % 4) == 2 && !s)
					nx += nw + mon->gappiv*ie;
				else if((i % 4) == 3 && !s)
					ny += nh + mon->gappih*ie;
			}
			if((i % 4) == 0) {
				if(s)
					ny += nh + mon->gappih*ie;
				else
					ny -= nh + mon->gappih*ie;
			}
			else if((i % 4) == 1)
				nx += nw + mon->gappiv*ie;
			else if((i % 4) == 2)
				ny += nh + mon->gappih*ie;
			else if((i % 4) == 3) {
				if(s)
					nx += nw + mon->gappiv*ie;
				else
					nx -= nw + mon->gappiv*ie;
			}
			if(i == 0)
			{
				if(n != 1)
					nw = (mon->ww - 2*mon->gappov*oe - mon->gappiv*ie) * mon->mfact;
				ny = mon->wy + mon->gappoh*oe;
			}
			else if(i == 1)
				nw = mon->ww - 2*mon->gappov*oe - mon->gappiv*ie - nw;
			i++;
		}
		resize(c, nx, ny, nw - 2 * c->bw, nh - 2 * c->bw, False);
	}
}
void
dwindle(Monitor *mon) {
	fibonacci(mon, 1);
}
void
spiral(Monitor *mon) {
	fibonacci(mon, 0);
}
