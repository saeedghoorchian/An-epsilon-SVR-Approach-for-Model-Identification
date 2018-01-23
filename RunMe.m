load ControllerEddie.mat

q1dot_0 = 45;
q2_0 = 0;
q3_0 = 0;

select_controller = 3;

addpath('./simulink')
open('GyroSimulation_2016a')
