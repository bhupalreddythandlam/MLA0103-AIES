hypothesis(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, headache),
    symptom(Patient, body_ache).

hypothesis(Patient, cold) :-
    symptom(Patient, sneezing),
    symptom(Patient, sore_throat),
    symptom(Patient, runny_nose).

hypothesis(Patient, measles) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, rash).

symptom(john, fever).
symptom(john, headache).
symptom(john, body_ache).

symptom(alice, sneezing).
symptom(alice, sore_throat).
symptom(alice, runny_nose).

symptom(bob, fever).
symptom(bob, cough).
symptom(bob, rash).