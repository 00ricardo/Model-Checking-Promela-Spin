# define N 5

int forks [N]; /* Forks being used (= pid + 1) or not (0) */

active [N] proctype Phil () {
	do
	:: 	printf (" philosopher %d thinks ...\n", _pid );

		/* pick up left and right forks if available */
		(forks [ _pid ] == 0); /* pick up left fork if available */
		forks [_pid ] = _pid+1;

		(forks [ (_pid + 1)%N ] == 0); /* pick up right fork if available */
		forks [ (_pid + 1)%N ] = _pid+1;


		printf (" philosopher %d eats using forks %d and %d\n", _pid, _pid, (_pid + 1)%N );


		/* put the two forks down */
		forks [_pid ] = 0; /* Put down the left fork */

		forks [ (_pid + 1)%N ] = 0; /* Put down the right fork */
	od
}