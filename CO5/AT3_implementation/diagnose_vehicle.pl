% Declare symptom as dynamic so facts can be added/removed at runtime
:- dynamic symptom/1.

% --- KNOWLEDGE BASE: PRODUCTION RULES ---

fault(battery_issue, 'Battery / Alternator Issue') :- 
    symptom(starting_failure), 
    symptom(warning_indicators).

fault(coolant_leak, 'Coolant System Leak') :- 
    symptom(engine_overheating), 
    symptom(warning_indicators).

fault(starter_issue, 'Starter Motor Degradation') :- 
    symptom(starting_failure), 
    symptom(abnormal_noise).

fault(engine_wear, 'Spark Plug / Engine Wear') :- 
    symptom(low_mileage), 
    symptom(abnormal_noise).

fault(unknown, 'Unknown Fault - Manual Inspection Required') :- 
    \+ fault(battery_issue, _), 
    \+ fault(coolant_leak, _), 
    \+ fault(starter_issue, _), 
    \+ fault(engine_wear, _).


% --- INFERENCE ENGINE & USER INTERFACE ---

start :-
    write('======================================================='), nl,
    write('         Automobile Fault Diagnostic System            '), nl,
    write('======================================================='), nl,
    write('Please answer yes. or no. to the following symptoms.'), nl,
    write('(Note: Ensure you include the period after your answer)'), nl, nl,
    
    % 1. Clear any previous symptoms from memory
    retractall(symptom(_)),
    
    % 2. Ask the user about specific symptoms
    ask(starting_failure),
    ask(warning_indicators),
    ask(engine_overheating),
    ask(abnormal_noise),
    ask(low_mileage),
    
    nl, write('--- DIAGNOSIS RESULT ---'), nl,
    
    % 3. Trigger the inference engine
    fault(_, FaultName),
    !, % The cut (!) stops Prolog from searching once a diagnosis is found
    
    write('Detected Fault: '), write(FaultName), nl,
    write('======================================================='), nl.

% Predicate to ask the user a question and record the fact if true
ask(Symptom) :-
    write('Does the vehicle exhibit '), write(Symptom), write('? (yes/no): '),
    read(Response),
    (Response == yes -> assert(symptom(Symptom)) ; true).