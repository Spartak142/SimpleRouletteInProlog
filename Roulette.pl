number(0,neither,neither,neither).
/** Numbers database. displays properties of each number and tells you whether it is or or even, red or black, and to which dozen it corresponds to. */

number(1,odd,red,first).
number(2,even,black,first).
number(3,odd,red,first).
number(4,even,black,first).
number(5,odd,red,first).
number(6,even,black,first).
number(7,odd,red,first).
number(8,even,black,first).
number(9,odd,red,first).
number(10,even,black,first).
number(11,odd,black,first).
number(12,even,red,first).
number(13,odd,black,second).
number(14,even,red,second).
number(15,odd,black,second).
number(16,even,red,second).
number(17,odd,black,second).
number(18,even,red,second).
number(19,odd,red,second).
number(20,even,black,second).
number(21,odd,red,second).
number(22,even,black,second).
number(23,odd,red,second).
number(24,even,black,second).
number(25,odd,red,third).
number(26,even,black,third).
number(27,odd,red,third).
number(28,even,black,third).
number(29,odd,black,third).
number(30,even,red,third).
number(31,odd,black,third).
number(32,even,red,third).
number(33,odd,black,third).
number(34,even,red,third).
number(35,odd,black,third).
number(36,even,red,third).

/** Predicate that start the program and provides a user with information about how to play the game */

start :-
write(' What is your name fortune seeker?'), nl,
read(Name1),
write(' Welcome to the game '),
write(Name1), nl,
write('How much money would you like to play with?'), nl,
read(Money),
write(' The amount of money you will be risking today is '),
write(Money),
write(' crowns'), nl,
write(' You can quit at anytime though. Simply type quit instead of placing a bet.'), nl,
write(' Good luck!'),nl,
write(' Bets can be placed on odd or even, red or black, a number or first, second or third dozen'), nl,
write(' Please enter your bet by typing it here and following with a . e.g. red.'), nl,
write(' If you would like to bet on a dozen type first, second or third following by .'), nl,
roulette(Money).	

/** Used when a player looses all the money */
roulette(0):- 
	write(' You lost all your money, time to stop!'),
	abort.

	/** This is the game engine so to say  */
roulette(Cash) :-
Cash > 0,	
/** This is a spin. Technically it happens before a user places his bets, but the game is fare. The number is still random and is not dependent  */
	random_between(0, 36, Outcome),
	/**	Uncomment this to win all the time
	write(Outcome), nl,
  	write(Oe), nl,
	write(Rb), nl,
	write(Dozen), nl,  */
	write(' What would you like to bet on?'), nl,
	read(Bettype),
/** Check if the player wants to quit or play  */
	(Bettype == quit -> timetoquit(Cash); number(Outcome, Oe, Rb, Dozen)),
	write(' How much money would you like to bet? '),
	read(Betamount),
	(Betamount > Cash -> badbet(Cash) ; goodbet(Betamount, Bettype)),
	write(' Current spin is '), 
	write(Outcome), write(' '), write(Rb), nl,
	write(' It is also '), write(Oe), write(' and corresponds to the '),
	write(Dozen), write(' dozen.'), nl,
	(Oe == Bettype -> Moe is 2; Moe is 0),
	(Rb == Bettype -> Mrb is 2; Mrb is 0),
	(Outcome == Bettype -> Mnum is 36; Mnum is 0),
	(Dozen == Bettype -> Mdoz is 3; Mdoz is 0),
	Cashleft is Cash-Betamount+ Betamount* Moe + Betamount* Mrb+ Betamount* Mdoz+ Betamount* Mnum,
	write(' You have '),	
	write(Cashleft), 
	write(' crowns available'), nl,
	roulette(Cashleft).

	
badbet(Cash):- write('Bet exceeds available cash, you would not want to leave without your jacket, would you?'), nl,
	roulette(Cash).

goodbet(Betamount, Bettype) :-
	write(' You have successfully placed '),
	write(Betamount),
	write(' crowns on '),
	write(Bettype), nl.
	
/** Used when a user decides to take the money  */
timetoquit(Out) :-
	write(' Thank you for playing with us! You are leaving with '),
	write(Out),
	write(' crowns.'), nl,
	write(' Not the worst one, trust me!'),
	abort.