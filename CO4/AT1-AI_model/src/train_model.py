import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier, export_text, plot_tree

# Your absolute path for the dataset
path = r'C:\Users\thand\OneDrive\Documents\AIES\lab\CO4\AT1-AI_model\data\student_performance.csv'

def main():
    # 1. Load the dataset
    print("Loading dataset...")
    df = pd.read_csv(path)

    # 2. Separate features (X) and target (y)
    X = df[['attendance_pct', 'internal_marks', 'assignment_score', 'study_hours_wk', 'prev_gpa']]
    y = df['target_status']

    # 3. Split into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # 4. Initialize and train the Decision Tree Classifier
    print("Training Inductive Learning model...")
    clf = DecisionTreeClassifier(criterion='entropy', max_depth=3, random_state=42)
    clf.fit(X_train, y_train)

    # 5. Evaluate basic accuracy
    accuracy = clf.score(X_test, y_test)
    print(f"Model Accuracy on Test Data: {accuracy * 100:.2f}%\n")

    # 6. Extract and print the generalized decision rules (Text)
    print("Generalized Decision Rules extracted from the data:")
    tree_rules = export_text(clf, feature_names=list(X.columns))
    print(tree_rules)

    # 7. Plot the Decision Tree Graphically
    print("\nGenerating graphical decision tree...")
    plt.figure(figsize=(10, 6)) # Set the window size
    plot_tree(clf, 
              feature_names=list(X.columns),  
              class_names=['Fail', 'Pass'], # Translates 0 and 1 into readable labels
              filled=True,   # Adds colors (orange for fail, blue for pass)
              rounded=True,  # Rounds the edges of the boxes
              fontsize=12)
    
    plt.title("Student Performance Prediction - Decision Tree Rules")
    
    # Save the visual to the same directory as your dataset
    save_path = r'C:\Users\thand\OneDrive\Documents\AIES\lab\CO4\AT1-AI_model\decision_tree_visual.png'
    plt.savefig(save_path)
    print(f"Decision tree visual saved successfully to: {save_path}")
    
    # Display the plot in a pop-up window
    plt.show()

if __name__ == "__main__":
    main()