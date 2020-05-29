% ALICE IN THE FOREST OF FORGETFULNESS

% Solutions to the Puzzles in Chapter 4 of the Book 'What is the name of this book?' by Raymond M. Smullyan.
% Proposed solutions and implementation by Valter Nunez.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNICORN AND THE LION

% When Alice entered the Forest of Forgetfulness, she did not
% forget everything; only certain things. She often forgot her
% name, and the one thing she was most likely to forget was
% the day of the week. Now, the Lion and the Unicorn were
% frequent visitors to the forest. These two are strange
% creatures. The Lion lies on Mondays, Tuesdays, and Wednesdays
% and tells the truth on the other days of the week.
% The Unicorn, on the other hand, lies on Thursdays, Fridays,
% and Saturdays, but tells the truth on the other days of
% the week.


yesterday(monday, sunday).
yesterday(tuesday, monday).
yesterday(wednesday, tuesday).
yesterday(thursday, wednesday).
yesterday(friday, thursday).
yesterday(saturday, friday).
yesterday(sunday, saturday).

tomorrow(monday, tuesday).
tomorrow(tuesday, wednesday).
tomorrow(wednesday, thursday).
tomorrow(thursday, friday).
tomorrow(friday, saturday).
tomorrow(saturday, sunday).
tomorrow(sunday, monday).

% Lion 
lying_day(lion, monday).
lying_day(lion, tuesday).
lying_day(lion, wednesday).

% Unicorn
lying_day(unicorn, thursday).
lying_day(unicorn, friday).
lying_day(unicorn, saturday).

% Exercise 47
% One day Alice met the Lion and the Unicorn resting under a
% tree. They made the following statements:
% 
% Lion / Yesterday was one of my lying days.
% Unicorn / Yesterday was one of my lying days too.
% 
% From these two statements, Alice (who was a very bright girl)
% was able to deduce the day of the week. What day was it?

ex_forty_seven(Today) :- 
	yesterday(Today, Yesterday),
	check_forty_seven(lion, Today, Yesterday),
	check_forty_seven(unicorn, Today, Yesterday),
    !.


check_forty_seven(Animal, Today, Yesterday) :-
	not(lying_day(Animal, Today)),
	lying_day(Animal, Yesterday).



check_forty_seven(Animal, Today, Yesterday) :-
	lying_day(Animal, Today),
	not(lying_day(Animal, Yesterday)). 


% Exercise 48
% On another occasion Alice met the Lion alone. He made the
% following two statements:
% 
% (1) I lied yesterday.
% (2) I will lie again two days after tomorrow.
% 
% What day of the week was it?

ex_forty_eight(Today) :-
    yesterday(Today, Yesterday),
    check1_forty_eight(lion, Today, Yesterday),
    check2_forty_eight(lion, Today),
    !.

check1_forty_eight(Animal, Today, Yesterday) :-
    not(lying_day(Animal, Today)),
    lying_day(Animal, Yesterday).

check1_forty_eight(Animal, Today, Yesterday) :-
    lying_day(Animal, Today),
    not(lying_day(Animal, Yesterday)).
    
check2_forty_eight(Animal, Today) :-
    tomorrow(Today, Tomorrow),
    tomorrow(Tomorrow, DayAfter),
    tomorrow(DayAfter, TwoAfter),
    not(lying_day(Animal, Today)),
    lying_day(Animal, TwoAfter).

check2_forty_eight(Animal, Today) :-
    tomorrow(Today, Tomorrow),
    tomorrow(Tomorrow, DayAfter),
    tomorrow(DayAfter, TwoAfter),
    lying_day(Animal, Today),
    not(lying_day(Animal, TwoAfter)).


% Exercise 49
% On what days of the week is it possible for the Lion to make
% the following two statements:
% 
% (1) I lied yesterday.
% (2) I will lie again tomorrow.

ex_forty_nine(Today) :-
    yesterday(Today, Yesterday),
    check1_forty_nine(lion, Today, Yesterday),
    check2_forty_nine(lion, Today).

check1_forty_nine(Animal, Today, Yesterday) :-
    not(lying_day(Animal, Today)),
    lying_day(Animal, Yesterday).

check1_forty_nine(Animal, Today, Yesterday) :-
    lying_day(Animal, Today),
    not(lying_day(Animal, Yesterday)).

check2_forty_nine(Animal, Today) :-
    tomorrow(Today, Tomorrow),
	not(lying_day(Animal, Today)),
	lying_day(Animal, Tomorrow).

check2_forty_nine(Animal, Today) :-
    tomorrow(Today, Tomorrow),
    lying_day(Animal, Today),
    not(lying_day(Animal, Tomorrow)).


% Exercise 50
% On what days of the week is it possible for the Lion to make
% the following single statement: 
% 
% "I lied yesterday and I will lie again tomorrow."
% 
% Warning! The answer is not the same
% as that of the preceding problem!

ex_fifty(Today) :-
    yesterday(Today, Yesterday),
    tomorrow(Today, Tomorrow),
    check1_fifty(lion, Today, Yesterday, Tomorrow).

check1_fifty(Animal, Today, Yesterday, Tomorrow) :-
    not(lying_day(Animal, Today)),
    lying_day(Animal, Yesterday),
    lying_day(Animal, Tomorrow).


check1_fifty(Animal, Today, Yesterday, Tomorrow) :-
    lying_day(Animal, Today),
    not(lying_day(Animal, Yesterday)),
    not(lying_day(Animal, Tomorrow)).

check1_fifty(Animal, Today, Yesterday, Tomorrow) :-
    lying_day(Animal, Today),
    not(lying_day(Animal, Yesterday)),
    lying_day(Animal, Tomorrow).
    
check1_fifty(Animal, Today, Yesterday, Tomorrow) :-
    lying_day(Animal, Today),
    lying_day(Animal, Yesterday),
    not(lying_day(Animal, Tomorrow)).
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TWEEDLEDUM AND TWEEDLEDEE

% During one month the Lion and the Unicorn were absent
% from the Forest of Forgetfulness. They were elsewhere,
% busily fighting for the crown.
% However, Tweedledum and Tweedledee were frequent
% visitors to the forest. Now, one of the two is like the
% Lion, lying on Mondays, Tuesdays, and Wednesdays and
% telling the truth on the other days of the week. The other
% one is like the Unicorn; he lie s on Thursdays, Fridays, and
% S aturdays but tells the truth the other days of the week.
% Alice didn't know which one was like the Lion and which
% one was like the Unicorn, To make matters worse, the
% brothers looked so much alike, that Alice could not even tell
% them apart (except when they wore their embroidered
% collars, which they seldom did), Thus poor Alice found the
% situation most confusing indeed! Now, here are some of
% Alice's adventures with Tweedledum and Tweedledee.

bro1(dum).
bro2(dee).

day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).
day(saturday).
day(sunday).
%%%%%%%%%%%
lying_day1(dum, monday).
lying_day1(dum, tuesday).
lying_day1(dum, wednesday).
lying_day2(dee, thursday).
lying_day2(dee, friday).
lying_day2(dee, saturday).


%%%%%%%%%%%%%
truth_day1(dum, sunday).
truth_day2(dee, sunday).


% Exercise 51
% One day Alice met the brothers together and they made the
% following statements:
% 
% First One / I' m Tweedledum.
% Second One / I' m Tweedledee.
% 
% Which one was really Tweedledum and which one was Tweedledee?

ex_fifty_one(Brother_One, Brother_Two) :-
    day(Today),
    check1_fifty_one(Brother_One, Brother_Two, Today).

check1_fifty_one(Bro1, Bro2, Today) :-
    truth_day1(Bro1, Today),
    truth_day2(Bro2, Today).


% Exercise 52

% On another day of that same week, the two brothers made
% the following statements:
% 
% First One / I' m Tweedledum.
% Second One / If that' s really true, then I'm Tweedledee!
% 
% Which was which?

ex_fifty_two(Brother_One, Brother_Two) :-
    day(Today),
    check1_fifty_two(Brother_One, Brother_Two, Today),
    bro1(Brother_Two),
    bro2(Brother_One),
    !.

check1_fifty_two(Bro1, Bro2, Today) :-
    lying_day1(Bro1, Today),
    not(lying_day2(Bro2, Today)).

check1_fifty_two(Bro1, Bro2, Today) :-
    lying_day2(Bro1, Today),
    not(lying_day1(Bro2, Today)).

% Exercise 53
% On another occasion, Alice met the two brothers, and asked
% one of them, "Do you lie on Sundays?" He replie d " Yes! '
% Then she asked the other one the same question.
% 
% What did he answer?


ex_fifty_three(Answer) :-
    day(Today),
    check1_fifty_three(_Brother_One, _Brother_Two, Today),
    Answer = 'no',
    !;
    Answer = 'yes',
    !.

check1_fifty_three(Bro1, Bro2, Today) :-
    lying_day1(Bro1, Today),
    not(truth_day1(Bro1, Today)),
    not(lying_day2(Bro2, Today)).

check1_fifty_three(Bro1, Bro2, Today) :-
    lying_day2(Bro2, Today),
    not(truth_day2(Bro2, Today)),
    not(lying_day1(Bro1, Today)).
    

% Exercise 54
% On another occasion, the brothers made the following
% statements:
% 
% First One / (1) I lie on Saturdays.
% 			  (2) I lie on Sundays.
% Second One / I will lie tomorrow.
% 
% What day of the week was it?

ex_fifty_four(Today) :-
    tomorrow(Today, Tomorrow),
    check1_fifty_four(_Brother_One, _Brother_Two), % true
    check2_fifty_four(_Brother_One2, _Brother_Two2, Today, Tomorrow),
    !.

check1_fifty_four(Bro1, Bro2) :-
    lying_day1(Bro1, saturday),
    lying_day1(Bro1, sunday);
    lying_day2(Bro2, saturday),
    lying_day2(Bro2, sunday);
    not(lying_day1(Bro1, saturday)),
    not(lying_day1(Bro1, sunday));
    not(lying_day2(Bro2, saturday)),
    not(lying_day2(Bro2, sunday)).


check2_fifty_four(Bro1, Bro2, Today, Tomorrow) :-
    lying_day1(Bro1, Tomorrow),
    not(lying_day1(Bro1, Today)),
    not(truth_day1(Bro1, Today));
    lying_day2(Bro2, Tomorrow),
    not(lying_day2(Bro2, Today)),
    not(truth_day2(Bro2, Today)).

% Exercise 55
% One day Alice came across just one of the brothers. He
% made the following statement: 
% 
% "I am lying today and I am Tweedledee."
% 
% Who was speaking?

ex_fifty_five(Brother) :-
    lying_day1(Brother, _Today),
    bro1(Brother), 
    !;
    not(lying_day1(Brother, _Today)),
    bro2(Brother), 
    !.

% Exercise 56
% Suppose, instead, he had said: 
% " I am lying today or I am Tweedledee." 
% Would it have been possible to determine who it was?

ex_fifty_six(Brother) :-
    not(lying_day1(Brother, _Today)),
    bro1(Brother),
    !;
    not(lying_day2(Brother, _Today)),
    bro1(Brother),
    !;
    lying_day1(Brother, _Today),
    bro2(Brother),
    !;
    lying_day2(Brother, _Today),
    bro2(Brother),
    !.

% Exercise 57
% One day Alice came across both brothers. They made the
% following statements:
% 
% First One / If I'm Tweedledum then he's Tweedledee.
% Second One / If he's Tweedledee then I'm Tweedledum.
% 
% Is it possible to determine who is who? 
% Is it possible to determine the day of the week?    

ex_fifty_seven(Brother_One, Brother_Two, Today) :-
    bro1(Brother_One),
    bro2(Brother_One),
    day(Today);
    bro1(Brother_Two),
    bro2(Brother_Two),
    day(Today);
    bro1(Brother_One),
    bro2(Brother_Two),
    Today = 'sunday';
    bro1(Brother_Two),
    bro2(Brother_One),
    Today = 'sunday'.


% Exercise 58
% On this great occasion, Alice resolved three grand mysteries.
% She came across the two brothers grinning under a
% tree. She hoped that on this encounter she would find out
% three things: 
% 
% (1) the day of the week; 
% (2) which of the two was Tweedledum; 
% (3) whether Tweedledum was like the Lion or the Unicorn in his lying habits 
% 
% Well, the two brothers made the following statements:
% 
% First One / Today is not Sunday.
% Second One / In fact, today is Monday.
% First One / Tomorrow is one of Tweedledee's lying days.
% Second One / The Lion lied yesterday.
% 
% Alice clapped her hands in joy. The problem was now completely
% solved. What is the solution?

ex_fifty_eight(Today, Brother_One, Brother_Two, Statement) :-
    day(Today),
    tomorrow(Today, Tomorrow),
    yesterday(Today, Yesterday),
    check1_fifty_eight(Today, Tomorrow, Yesterday, Brother_One,Brother_Two, Statement),
    !.

check1_fifty_eight(Today, Tomorrow, Yesterday, Bro1, Bro2, Statement) :-
    not(lying_day1(_Bro1, Today)),
    lying_day2(_Bro2, Today),
    truth_day1(_Bro3, Today);
    lying_day1(_Bro4, Today),
    not(lying_day2(_Bro5, Today)),
    truth_day2(_Bro6, Today);
    lying_day1(_Bro7, Today),
    lying_day1(_Bro8, Tomorrow),
    lying_day1(_Bro9, Yesterday),
    Today = not('monday'),
    Bro1 = 'dum',
    Bro2 = 'dee',
    Statement = 'Dee lies like the Lion and Dum like the Unicorn';
    lying_day2(_Bro10, Today),  % el bueno
    lying_day2(_Br11, Tomorrow),
    lying_day2(_Bro12, Yesterday),
    Bro1 = 'dum',
    Bro2 = 'dee',
    Statement = 'Dum lies like the Lion and Dee like the Unicorn'.
    


