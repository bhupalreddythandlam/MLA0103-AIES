% =====================================================================
% CROP DISEASE ADVISORY EXPERT SYSTEM
% =====================================================================

:- dynamic field/5.

% =====================================================================
% 1. KNOWLEDGE BASE: FACTS (Test Cases)
% Format: field(FarmName, LeafSymptom, Weather, Humidity, SoilCondition).
% =====================================================================

field(roopesh_farm, dark_spots, cool, high, normal).
field(sadhuq_farm, wilting, normal, normal, waterlogged).
field(madhu_farm, white_powder, warm, normal, normal).
field(nivas_farm, none, normal, normal, normal).


% =====================================================================
% 2. PRODUCTION RULES (Disease Identification)
% =====================================================================

% Rule 1: Late Blight
disease(Farm, late_blight) :-
    field(Farm, dark_spots, cool, high, _).

% Rule 2: Root Rot
disease(Farm, root_rot) :-
    field(Farm, wilting, _, _, waterlogged).

% Rule 3: Powdery Mildew
disease(Farm, powdery_mildew) :-
    field(Farm, white_powder, warm, _, _).

% Rule 4: Healthy Crop
disease(Farm, healthy) :-
    field(Farm, none, _, _, _).


% =====================================================================
% 3. PRODUCTION RULES (Recommendations/Actions)
% =====================================================================

action(Farm, apply_fungicide) :- disease(Farm, late_blight).
action(Farm, improve_drainage) :- disease(Farm, root_rot).
action(Farm, apply_sulfur_spray) :- disease(Farm, powdery_mildew).
action(Farm, continue_maintenance) :- disease(Farm, healthy).


% =====================================================================
% 4. FORWARD CHAINING IMPLEMENTATION
% =====================================================================
forward_chaining(Farm) :-
    write('=========================================='), nl,
    write('            FORWARD CHAINING              '), nl,
    write('=========================================='), nl,
    field(Farm, Leaf, Weather, Humidity, Soil),
    write('Initial Facts'), nl,
    write('Farm: '), write(Farm), nl,
    write('Leaf Symptoms: '), write(Leaf), nl,
    write('Weather: '), write(Weather), nl,
    write('Humidity: '), write(Humidity), nl,
    write('Soil Condition: '), write(Soil), nl, nl,
    
    (disease(Farm, late_blight) -> write('Rule 1 Fired: \nDark spots + Cool Weather + High Humidity \n=> Late Blight Detected\n'), nl ; true),
    (disease(Farm, root_rot) -> write('Rule 2 Fired: \nWilting leaves + Waterlogged Soil \n=> Root Rot Detected\n'), nl ; true),
    (disease(Farm, powdery_mildew) -> write('Rule 3 Fired: \nWhite powder + Warm Weather \n=> Powdery Mildew Detected\n'), nl ; true),
    (disease(Farm, healthy) -> write('Rule 4 Fired: \nNo symptoms \n=> Crop is Healthy\n'), nl ; true),
    
    write('------------------------------------------'), nl,
    write('Derived Conclusions'), nl,
    write('------------------------------------------'), nl,
    (disease(Farm, D) -> write('-> disease_'), write(D), nl ; true),
    (action(Farm, A) -> write('-> action_'), write(A), nl ; true).


% =====================================================================
% 5. BACKWARD CHAINING IMPLEMENTATION
% =====================================================================
check_goal(Goal, true) :- call(Goal), !.
check_goal(_, false).

backward_chaining(Farm) :-
    write('=========================================='), nl,
    write('            BACKWARD CHAINING             '), nl,
    write('=========================================='), nl,
    write('Goal-driven reasoning:'), nl, nl,
    
    check_goal(disease(Farm, late_blight), R1), write('Goal: disease_late_blight -> '), write(R1), nl,
    check_goal(disease(Farm, root_rot), R2), write('Goal: disease_root_rot -> '), write(R2), nl,
    check_goal(disease(Farm, powdery_mildew), R3), write('Goal: disease_powdery_mildew -> '), write(R3), nl,
    check_goal(disease(Farm, healthy), R4), write('Goal: healthy_crop -> '), write(R4), nl,
    check_goal(action(Farm, apply_fungicide), R5), write('Goal: apply_fungicide -> '), write(R5), nl,
    check_goal(action(Farm, improve_drainage), R6), write('Goal: improve_drainage -> '), write(R6), nl,
    nl, write('Backward chaining completed.'), nl.


% =====================================================================
% 6. MAIN ADVISOR SYSTEM (Generates Final Report)
% =====================================================================
diagnose(Farm) :-
    write('=========================================='), nl,
    write('       CROP DISEASE ADVISORY SYSTEM       '), nl,
    write('=========================================='), nl,
    write('Farm: '), write(Farm), nl,
    forward_chaining(Farm), nl,
    backward_chaining(Farm), nl,
    write('=========================================='), nl,
    write('          FINAL ADVISORY REPORT           '), nl,
    write('=========================================='), nl,
    write('Recommendations:'), nl,
    (action(Farm, apply_fungicide) -> write('[*] Apply Fungicide immediately to halt spread.'), nl ; true),
    (action(Farm, improve_drainage) -> write('[*] Improve soil drainage and reduce watering.'), nl ; true),
    (action(Farm, apply_sulfur_spray) -> write('[*] Apply Sulfur Spray to affected leaves.'), nl ; true),
    (action(Farm, continue_maintenance) -> write('[*] Crop is performing well. Continue standard maintenance.'), nl ; true).


% =====================================================================
% 7. TEST ALL SCENARIOS
% =====================================================================
test_all :-
    diagnose(roopesh_farm), nl, nl,
    diagnose(sadhuq_farm), nl, nl,
    diagnose(madhu_farm), nl, nl,
    diagnose(nivas_farm).