## 🚀 How to Run the Expert System

### Prerequisites

* [SWI-Prolog](https://www.swi-prolog.org/) installed on your machine.

---

### Execution Steps

1. **Clone the repository:**
```bash
git clone https://github.com/TBhupal/CO5_Crop_Disease_Expert_System.git
cd CO5_Crop_Disease_Expert_System

```


2. **Open SWI-Prolog console:**
* Launch SWI-Prolog.
* Load the project file:
* Via GUI: Click **File** > **Consult...** > Select `implementation.pl`.
* Via Console:
```prolog
?- [implementation].

```

3. **Run Queries:**
* **Run all test scenarios:**
```prolog
?- test_all.

```


* **Diagnose a specific field:**
```prolog
?- diagnose(roopesh_farm).

```


* **Test Unification & Backtracking:**
```prolog
?- disease(X, late_blight).

```


*(Press `;` to view additional matches via backtracking)*
