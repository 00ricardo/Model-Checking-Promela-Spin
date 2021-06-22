# define N 5

int forks [N]; /* Forks being used (= pid + 1) or not (0) */
int forksCount [N]; /* Number of philosophers using a fork */

active [N] proctype Phil () {
	do
	:: 	printf (" philosopher %d thinks ...\n", _pid );

		(forks [ _pid ] == 0); /* pick up left fork if available */

		forks [_pid ] = _pid+1;
		forksCount [_pid] ++; /* increment number of philosophers using the fork */

		assert ( (forksCount [_pid] == 1) ); /* verify there is only 1 philosopher using this fork */


		(forks [ (_pid + 1)%N ] == 0); /* pick up right fork if available */

		forks [ (_pid + 1)%N ] = _pid+1;
		forksCount [ (_pid + 1)%N ] ++; /* increment number of philosophers using the fork */


		assert (forksCount [ (_pid + 1)%N ] == 1); /* verify there is only 1 philosopher using this fork */
		
		printf (" philosopher %d eats using forks %d and %d\n", _pid, _pid, (_pid + 1)%N );

		/* put the two forks down */

		forks [_pid ] = 0; /* Put down the left fork */
		forksCount [_pid] --; /* decrease the number of philosophers using the fork */


		forks [ (_pid + 1)%N ] = 0; /* Put down the right fork */
		forksCount [ (_pid + 1)%N ] --; /* decrease the number of philosophers using the fork */
	od
}







