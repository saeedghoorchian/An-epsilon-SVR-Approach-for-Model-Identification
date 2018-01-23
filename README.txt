An ε-SVR approach for identification of LPV models. This describes how to train the SVR algorithm and evaluate on the cross validation set and test on the test set. As a demonstration of performance of the proposed algorithm, you can train, evaluate and test on the data coming form the nonlinear model of the Gyroscope. More specifically, It can be used to identify the parameter dependency in LPV models.

1- Run the file “RunMe” 
This sets up the initial configuration for running the simulink model of Gyroscope

2- Run the simulink file “GyroSimulation_2016a”
Here you can collect the training data points (y_data, u_data, and rho_data)
This file is taken from previous work. It helps to simulate the nonlinear model of Gyroscope

3- Run the Matlab file “Main”
This one calls all the necessary files to train the ε-SVR algorithm and evaluate the trained algorithm on the cross validation set to investigate the performance of the model. here is how it works:
3a- you can choose the hyperparameters for the ε-SVR algorithm
3b- It constructs the kernel matrix, and preprocess the data points in feature space 
3c- Calls the function “SVR” to solve the optimization problem for SVR algorithm and returns the a history of optimization process, including optimal dual variable and function evaluation in each step
3d- Calls the function “PlotDualVariable” to retrieve the minimum points computed in each optimization problem. It also plots the optimal dual variables and cost function value in each iteration. The nonzero dual variables are support vectors.
3e- Calls the function “EvaluateSVRAlgorithm” to evaluate the trained algorithm on cross validation set. You can specify the cross validation set. It also computes the R^2 as a measure how good is our SVR model fitted to the data and plots the residuals (the difference between original point and approximated one using SVR) as a histogram 

4- Run the file “GyroSimulationAndIdentification_2016a”
In this step we can test the trained algorithm on the test set. Specify the dimension of the variables in the matlab function in simulink model. This function takes as input the test data point and computes its value on the function trained by SVR algorithm.