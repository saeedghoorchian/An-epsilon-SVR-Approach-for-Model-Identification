function history = SVR(yd, m, K, C, epsilon)

I = ones(m,1);
I2 = ones(2*m,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set the shared variables with outfun
history.x = [];
history.fval = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set initial point
optvar0 = (1/1000)*ones(2*m,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calls the optimization, Don't change the constraints
options = optimoptions(@fmincon,'OutputFcn',@outfun,... 
    'Display','iter','Algorithm','sqp','MaxIter', 400);
optvar = fmincon(@objfun,optvar0,[],[],[],[],zeros(2*m,1),(C/m)*I2,@confun,options);

 function stop = outfun(x,optimValues,state)
     stop = false;
 
     switch state
         case 'init'
             hold on
         case 'iter'
           history.fval = [history.fval; optimValues.fval];
           history.x = [history.x; x];
         case 'done'
             hold off
         otherwise
     end
 end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Objective Function
 function f = objfun(optvar)
     f =((1/2)*((transpose(optvar(1:m,:)) - transpose(optvar((m+1):(2*m),:)))*K*(optvar(1:m,:) - optvar((m+1):(2*m),:))) + (epsilon*transpose(I)*(optvar(1:m,:) + optvar((m+1):(2*m),:))) - (transpose(yd)*(optvar(1:m,:) - optvar((m+1):(2*m),:))));
 end

end