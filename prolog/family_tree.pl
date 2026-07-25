female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

mother(M, C) :- 
    parent(M, C), 
    female(M).

father(F, C) :- 
    parent(F, C), 
    male(F).

grandfather(GF, GC) :- 
    father(GF, P), 
    parent(P, GC).

grandmother(GM, GC) :- 
    mother(GM, P), 
    parent(P, GC).

sister(S, Sibling) :- 
    parent(P, S), 
    parent(P, Sibling), 
    female(S), 
    S \= Sibling.

brother(B, Sibling) :- 
    parent(P, B), 
    parent(P, Sibling), 
    male(B), 
    B \= Sibling.