studies(alice, cs101).
studies(bob, math202).
studies(charlie, cs101).
studies(diana, phys301).

teaches(smith, cs101).
teaches(jones, math202).
teaches(miller, phys301).

student_teacher_subcode(Student, Teacher, SubCode) :-
    studies(Student, SubCode),
    teaches(Teacher, SubCode).