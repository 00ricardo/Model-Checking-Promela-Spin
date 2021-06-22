bool turn , flag [2];
int count;

active [2] proctype P() {

	non_cs :
		flag [ _pid ] = 1; 							/* wants to enter critical section */
		turn = 1 - _pid ; 							/* politely give turn to the other one */
		(! flag [1 - _pid ] || turn == _pid ); 		/* block until the other doesn ’t want */
													/* OR it is this one ’s turn */
	cs:
		count++; /* enters critical section */

		skip ; /* critical section */
	
		assert ( count == 1 ); /* there is only 1 process here */

		count--;  /* leaves critical section */

	exit :
		flag [ _pid ] = 0; /* leaves the critical section */
		goto non_cs
}