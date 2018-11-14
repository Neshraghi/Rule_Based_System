/*
The program for driving a car. Assignment 2.
*/

%%%% assessment of the correctness of the input information

%% contradictory facts about the speed:

do(True_facts,'incorrect information'):-
	member(f1,True_facts),
	member(f2,True_facts),!.

do(True_facts,'incorrect information'):-
	member(f1,True_facts),
	member(f3,True_facts),!.

do(True_facts,'incorrect information'):-
	member(f2,True_facts),
	member(f3,True_facts),!.

%% contradictory facts about the road:
 
do(True_facts,'incorrect information'):-
	member(f4,True_facts),
	member(f5,True_facts),!.

do(True_facts,'incorrect information'):-
	member(f4,True_facts),
	member(f9,True_facts),!.

do(True_facts,'incorrect information'):-
	member(f5,True_facts),
	member(f8,True_facts),!.

do(True_facts,'incorrect information'):-
	member(f8,True_facts),
	member(f9,True_facts),!.

%% passing is possible just on a four-lane road (assumption 3) and 
%  if there is no intersection nearby (we try to drive safely!) and
%  if f7, f10 and f11 are false (assumption 2)

f12_is_impossible(True_facts):-
	member(f4,True_facts); 		
	member(f6,True_facts); 		
	member(f7,True_facts); 
	member(f8,True_facts); 
	member(f10,True_facts); 
	member(f11,True_facts).

do(True_facts,'incorrect information'):-
	member(f12,True_facts),
	f12_is_impossible(True_facts),!.


%%%% decision rules

do(True_facts,'Pass'):-member(f12,True_facts),!.

do(True_facts,'Slow down'):-member(f6,True_facts),!.

do(True_facts,'Slow down'):-member(f10,True_facts),!.

do(True_facts,'Slow down'):-member(f3,True_facts),!.

do(True_facts,'Pass'):-
	member(f5,True_facts),
	member(f11,True_facts),
	not(member(f9,True_facts)),!.

do(True_facts,'Slow down'):-
	member(f11,True_facts),!.

do(True_facts,'Slow-Down'):-
	member(f7,True_facts),!.

do(True_facts,'Slow-Down'):-
	member(f5,True_facts),
	member(f9,True_facts),!.

do(True_facts,'Speed-Up'):-member(f1,True_facts),!.

do(True_facts,'Maintain'):-member(f2,True_facts),!.


%%%% the last rule for situations when the input information isn't complete

do(_,'not enough information').
