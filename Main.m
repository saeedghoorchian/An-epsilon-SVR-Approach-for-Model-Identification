%% Set the Hypermaraters, Only change m, C, and Kernel_Var
%Choose Kernel function parameter
Kernel_Var = 0.01;
%Choose number of training data points
m = 100;
%Modify the upper constraint for dual variables in SVR optimization problem
C = 100000;
%Choose the desired epsilon. The smaller it is, number of support vectors
%increases
epsilon = 0.0000000000001;

%% Other variables. Choose the training data
n = 10;
ydata = y_data.data(1:5000,:);
y1 = ydata(2:m+1,1) - mean(ydata(2:m+1,1));
y2 = ydata(2:m+1,2) - mean(ydata(2:m+1,2));
y3 = ydata(2:m+1,3) - mean(ydata(2:m+1,3));
y4 = ydata(2:m+1,4) - mean(ydata(2:m+1,4));
y5 = ydata(2:m+1,5) - mean(ydata(2:m+1,5));
y6 = ydata(2:m+1,6) - mean(ydata(2:m+1,6));
y7 = ydata(2:m+1,7) - mean(ydata(2:m+1,7));
y8 = ydata(2:m+1,8) - mean(ydata(2:m+1,8));
rhodata = rho_data.data(1:5000,:);
udata = u_data.data(1:5000,:);

ydata = [zeros(1,8) ; ydata];
xopt = [ydata(1:m,:) udata(1:m,:)];
%xopt = [ydata(1:m,:) udata(2:m+1,:)];
%xopt = @(k)([ydata(k-1,:) udata(k,:)]);

K_test = zeros(1,m);
I_test = (1/m)*ones(1,m);

%% Construct the Kernel Matrix, Center and normalize the data points in feature space
K = zeros(m,m);
for i =1:m
    for j =1:m
%for i = 2:(m+1)
%    for j = 2:(m+1)
        xleft = xopt(i,:);
        xright = xopt(j,:);
%       xleft = xopt(i);
%       xright = xopt(j);
        for k = 1:n
        K(i,j) = K(i,j) + xleft(k)*exp(-(norm(rhodata(i,:) - rhodata(j,:))^2)/Kernel_Var)*xright(k);
%       K(i-1,j-1) = K(i-1,j-1) + xleft(k)*exp(-(norm(rhodata(i,:) - rhodata(j,:))^2)/Kernel_Var)*xright(k);
        end
    end
end

Im = (1/m)*ones(m,m);
K_Processed = K - (Im*K) - (K*Im) + (Im*K*Im);
% K_Normalized = zeros(m,m);
% for i = 1:m
%     for j = 1:m
%         K_Normalized(i,j) = K_Normalized(i,j) + K_Centered(i,j)/sqrt(K_Centered(i,i)*K_Centered(j,j));
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solve the Optimization to find optimum dual variables
history1 = SVR(y1, m, K_Processed, C, epsilon);
history2 = SVR(y2, m, K_Processed, C, epsilon);
history3 = SVR(y3, m, K_Processed, C, epsilon);
history4 = SVR(y4, m, K_Processed, C, epsilon);
history5 = SVR(y5, m, K_Processed, C, epsilon);
history6 = SVR(y6, m, K_Processed, C, epsilon);
history7 = SVR(y7, m, K_Processed, C, epsilon);
history8 = SVR(y8, m, K_Processed, C, epsilon);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot dual variables, Plot cost function for each component separately
h1 = figure;
h2 = figure;

[alpha1_star, alpha1, alpha2_star, alpha2, alpha3_star, alpha3, alpha4_star, alpha4, alpha5_star, alpha5, alpha6_star, alpha6, alpha7_star, alpha7, alpha8_star, alpha8] = PlotDualVariables(h1, history1, history2, history3, history4, history5, history6, history7, history8, m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evaluate SVR algorithm, Choose the Cross Validation set or test set
y_chosen = ydata(m+1:2*m,:);
rho_chosen =  rhodata(m+1:2*m+1,:);
u_chosen = udata(m+1:2*m+1,:);

EvaluateSVRAlgorithm(h2, m, n, Kernel_Var, K, Im, y_chosen, rho_chosen, u_chosen, rhodata, xopt, alpha1_star, alpha1, alpha2_star, alpha2, alpha3_star, alpha3, alpha4_star, alpha4, alpha5_star, alpha5, alpha6_star, alpha6, alpha7_star, alpha7, alpha8_star, alpha8)