# Iris Dataset Dashboard

Soumya Savarn  
**Roll Number**: 220150031  
**YouTube Demo**: https://www.youtube.com/watch?v=qG-8v71tYW0
**Live Deployment**: https://u2cv91-soumya-savarn.shinyapps.io/dashboard_iris/

This project is a data visualization dashboard created using R Shiny, showcasing the Iris dataset with interactive features for exploring the dataset and its clustering. The dashboard consists of four main pages:

---

## 1. **K-Means and Bar Plot**
   - **Description**:  
     This page implements K-Means clustering on the Iris dataset. Users can select variables for the X and Y axes and view clustering results.
   - **Features**:  
     - Dropdown menus for selecting X and Y variables.
     - A scatter plot displaying the K-Means clustering results, where each point is colored according to its cluster.
     - A bar chart representing the size of each cluster.
   - **Backend**:  
     The clustering is computed using the `kmeans` function in R, and the results are dynamically updated with user selections.

---

## 2. **Scatter Plot**
   - **Description**:  
     This page provides a simple scatter plot for exploring relationships between any two variables in the dataset.
   - **Features**:  
     - Pairwise Scatter Plot Visualisation
   - **Backend**:  
     Uses `ggplot2` for creating the scatter plot, with interactivity powered by Shiny's `renderPlot`.

---

## 3. **Density Plot**
   - **Description**:  
     This page displays density plots for analyzing the distribution of each numeric variable.
   - **Features**:  
     - Dropdown to select a variable for visualization.
     - Overlaid density curves for each species.
   - **Backend**:  
     The density plots are created using `geom_density` in `ggplot2`, grouped by species for comparison.

---

## 4. **KNN Cluster Prediction**
   - **Description**:  
     This page demonstrates the prediction of species using a K-Nearest Neighbors (KNN) classifier.
   - **Features**:  
     - A pre-trained KNN model is used to classify test points.
     - Users can upload new data for prediction.
   - **Backend**:  
     The `class::knn` function is used for classification, and predictions are displayed in a table or plot.

---

## Technical Implementation
1. **Framework**:  
   Built using R Shiny for interactivity and deployed via ShinyApps.io.
2. **Libraries Used**:  
   - `ggplot2`: For data visualization.
   - `dplyr`: For data manipulation.
   - `shiny`: For building the interactive web app.
   - `class`: For implementing the KNN model.

---
