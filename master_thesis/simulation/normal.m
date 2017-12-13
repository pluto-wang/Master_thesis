% Normal mode
clear
close all
clc

import traci.constants

scenarioPath = 'D:\map\100\92\map.sumo.cfg';
system(['sumo-gui -c ' '"' scenarioPath '"' ' --remote-port 8873&']);

SIM_STEPS = [1 1000];
beginTime = SIM_STEPS(1);
duration =  SIM_STEPS(2);
endTime =  SIM_STEPS(1) +  SIM_STEPS(2) - 1;
% declare variables and set parameters


fprintf('start\n');
% Initialize TraCI
traci.init();

for i = 1: duration
    
    % perform a simulation step
    traci.simulationStep();
    fprintf('interation %d\n',i);
    road = traci.vehicle.getRoadID('0');
end
traci.close();


