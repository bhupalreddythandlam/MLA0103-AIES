diet_for(diabetes, low_carb).
diet_for(diabetes, sugar_free).
diet_for(diabetes, high_fiber).
diet_for(hypertension, low_sodium).
diet_for(hypertension, dash_diet).
diet_for(celiac, gluten_free).
diet_for(heart_disease, low_fat).
diet_for(heart_disease, high_omega3).

suggest_diet(Disease, Diet) :-
    diet_for(Disease, Diet).