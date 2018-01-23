function [] = EvaluateSVRAlgorithm(h2, m, n, Kernel_Var, K, Im, y_chosen, rho_chosen, u_chosen, rhodata, xopt, alpha1_star, alpha1, alpha2_star, alpha2, alpha3_star, alpha3, alpha4_star, alpha4, alpha5_star, alpha5, alpha6_star, alpha6, alpha7_star, alpha7, alpha8_star, alpha8)

yapprox = zeros(m,8);
yorig = y_chosen;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COmputes the approximated value for test points by constructing test Kernel matrix and using optimal dual variables coming form SVR optimization problem
for i = 1:m
    
ytest = y_chosen(i,:);
rhotest = rho_chosen(i+1,:);
utest = u_chosen(i+1,:);
xtest = [ytest utest];

Ktest = zeros(1,m);
Itest = (1/m)*ones(1,m);

%% Computes The test Kernel Matrix and center it
for j = 1:m
    xright = xopt(j,:);
    for k = 1:n
    Ktest(1,j) = Ktest(1,j) + xtest(k)*exp(-(norm(rhotest-rhodata(j,:))^2)/Kernel_Var)*xright(k);
    end
end
Ktest_Centered = Ktest - (Itest*K) - (Ktest*Im) + (Itest*K*Im);

%% Approximated values for each 8 different component of the test point 
yapprox(i,1) = yapprox(i,1) + Ktest_Centered*(alpha1_star - alpha1);
yapprox(i,2) = yapprox(i,2) + Ktest_Centered*(alpha2_star - alpha2);
yapprox(i,3) = yapprox(i,3) + Ktest_Centered*(alpha3_star - alpha3);
yapprox(i,4) = yapprox(i,4) + Ktest_Centered*(alpha4_star - alpha4);
yapprox(i,5) = yapprox(i,5) + Ktest_Centered*(alpha5_star - alpha5);
yapprox(i,6) = yapprox(i,6) + Ktest_Centered*(alpha6_star - alpha6);
yapprox(i,7) = yapprox(i,7) + Ktest_Centered*(alpha7_star - alpha7);
yapprox(i,8) = yapprox(i,8) + Ktest_Centered*(alpha8_star - alpha8);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Computes the R^2 for each 8 components of output
SSE1 = norm(yorig(:,1) - yapprox(:,1))^2;
SST1 = norm(yorig(:,1) - mean(yorig(:,1)))^2;
SSR1 = norm(yapprox(:,1) - mean(yorig(:,1)))^2;
R1_squared = 1 - (SSE1/SST1);
fprintf('R1^2 is = %i\n', R1_squared)

SSE2 = norm(yorig(:,2) - yapprox(:,2))^2;
SST2 = norm(yorig(:,2) - mean(yorig(:,2)))^2;
SSR2 = norm(yapprox(:,2) - mean(yorig(:,2)))^2;
R2_squared = 1 - (SSE2/SST2);
fprintf('R2^2 is = %i\n', R2_squared)

SSE3 = norm(yorig(:,3) - yapprox(:,3))^2;
SST3 = norm(yorig(:,3) - mean(yorig(:,3)))^2;
SSR3 = norm(yapprox(:,3) - mean(yorig(:,3)))^2;
R3_squared = 1 - (SSE3/SST3);
fprintf('R3^2 is = %i\n', R3_squared)

SSE4 = norm(yorig(:,4) - yapprox(:,4))^2;
SST4 = norm(yorig(:,4) - mean(yorig(:,4)))^2;
SSR4 = norm(yapprox(:,4) - mean(yorig(:,4)))^2;
R4_squared = 1 - (SSE4/SST4);
fprintf('R4^2 is = %i\n', R4_squared)

SSE5 = norm(yorig(:,5) - yapprox(:,5))^2;
SST5 = norm(yorig(:,5) - mean(yorig(:,5)))^2;
SSR5 = norm(yapprox(:,5) - mean(yorig(:,5)))^2;
R5_squared = 1 - (SSE5/SST5);
fprintf('R5^2 is = %i\n', R5_squared)

SSE6 = norm(yorig(:,6) - yapprox(:,6))^2;
SST6 = norm(yorig(:,6) - mean(yorig(:,6)))^2;
SSR6 = norm(yapprox(:,6) - mean(yorig(:,6)))^2;
R6_squared = 1 - (SSE6/SST6);
fprintf('R6^2 is = %i\n', R6_squared)

SSE7 = norm(yorig(:,7) - yapprox(:,7))^2;
SST7 = norm(yorig(:,7) - mean(yorig(:,7)))^2;
SSR7 = norm(yapprox(:,7) - mean(yorig(:,7)))^2;
R7_squared = 1 - (SSE7/SST7);
fprintf('R7^2 is = %i\n', R7_squared)

SSE8 = norm(yorig(:,8) - yapprox(:,8))^2;
SST8 = norm(yorig(:,8) - mean(yorig(:,8)))^2;
SSR8 = norm(yapprox(:,8) - mean(yorig(:,8)))^2;
R8_squared = 1 - (SSE8/SST8);
fprintf('R8^2 is = %i\n', R8_squared)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Rediduals (the difference between original point and approximated one using SVR) as a histogram for each 8 different component 
figure(h2)

subplot(1,8,1);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,2);
y2_error = yorig(:,2) - yapprox(:,2);
histogram(y2_error,10)

subplot(1,8,3);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,4);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,5);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,6);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,7);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

subplot(1,8,8);
y1_error = yorig(:,1) - yapprox(:,1);
histogram(y1_error,20)

fprintf('Done!')

end