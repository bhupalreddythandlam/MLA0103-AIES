% Declare symptom as a dynamic predicate so facts can be added/removed at runtime
:- dynamic symptom/1.

% --- KNOWLEDGE BASE: PRODUCTION RULES ---

% Rule 1: COVID-19
diagnose(covid_19, 'COVID-19') :-
    symptom(fever),
    symptom(cough),
    symptom(breathing_difficulty),
    symptom(fatigue).

% Rule 2: Pneumonia
diagnose(pneumonia, 'Pneumonia') :-
    symptom(fever),
    symptom(cough),
    symptom(breathing_difficulty),
    symptom(body_pain).

% Rule 3: Flu (Influenza)
diagnose(flu, 'Flu (Influenza)') :-
    symptom(fever),
    symptom(cough),
    symptom(body_pain),
    symptom(fatigue),
    \+ symptom(breathing_difficulty). % \+ means "not provable" (patient doesn't have it)

% Rule 4: Common Cold
diagnose(common_cold, 'Common Cold') :-
    symptom(cough),
    symptom(fatigue),
    \+ symptom(fever),
    \+ symptom(breathing_difficulty).

% Rule 5: Unknown
diagnose(unknown, 'Unknown / Insufficient Data') :-
    \+ diagnose(covid_19, _),
    \+ diagnose(pneumonia, _),
    \+ diagnose(flu, _),
    \+ diagnose(common_cold, _).


% --- EXPLANATION MODULE ---

explain(covid_19) :-
    write('Reasoning: The patient exhibits a critical combination of fever, cough, fatigue, and breathing difficulty, which are strong indicators of COVID-19.'), nl.

explain(pneumonia) :-
    write('Reasoning: The presence of fever, cough, body pain, and especially breathing difficulty points towards a severe respiratory infection like Pneumonia.'), nl.

explain(flu) :-
    write('Reasoning: The patient has fever, cough, body pain, and fatigue, but lacks breathing difficulty, which typically differentiates the Flu from more severe conditions.'), nl.

explain(common_cold) :-
    write('Reasoning: The patient presents with mild symptoms (cough and fatigue) without a fever or breathing difficulty, suggesting a standard Common Cold.'), nl.

explain(unknown) :-
    write('Reasoning: The specific combination of symptoms provided does not firmly match the predefined rules for COVID-19, Pneumonia, Flu, or the Common Cold in this system. Further clinical evaluation is required.'), nl.


% --- USER INTERFACE & INFERENCE ENGINE ---

% Main predicate to start the diagnostic system
start :-
    write('======================================================='), nl,
    write('      Preliminary Healthcare Diagnostic System         '), nl,
    write('======================================================='), nl,
    write('Please answer yes. or no. to the following symptoms.'), nl,
    write('(Note: Ensure you include the period after your answer)'), nl, nl,
    
    % Clear any previous symptoms from memory
    clear_symptoms,
    
    % Ask the user about specific symptoms
    ask(fever),
    ask(cough),
    ask(breathing_difficulty),
    ask(body_pain),
    ask(fatigue),
    
    nl, write('--- DIAGNOSIS RESULTS ---'), nl,
    
    % Trigger the inference engine (Forward/Backward Chaining)
    diagnose(ConditionID, ConditionName),
    !, % The cut (!) prevents Prolog from looking for alternative diagnoses once one is found
    
    write('Possible Condition: '), write(ConditionName), nl,
    explain(ConditionID),
    write('======================================================='), nl,
    
    % Clean up memory after diagnosis
    clear_symptoms.

% Predicate to ask the user a question and record the fact if true
ask(Symptom) :-
    write('Does the patient have '), write(Symptom), write('? (yes/no): '),
    read(Response),
    (Response == yes -> assert(symptom(Symptom)) ; true).

% Predicate to retract all dynamically asserted facts
clear_symptoms :-
    retractall(symptom(_)).