% Passive mode
clear
close all
clc

import traci.constants

scenarioPath = 'D:\map\100\51\map.sumo.cfg';
system(['sumo-gui -c ' '"' scenarioPath '"' ' --remote-port 8873&']);
SIM_STEPS = [1 1000];
beginTime = SIM_STEPS(1);
duration =  SIM_STEPS(2);
endTime =  SIM_STEPS(1) +  SIM_STEPS(2) - 1;
% declare variables and set parameters
stopflag = 0;
breakflag = 0;
isresume = 1;
mul = 0;
c1 = 0;
c2 = 0;
temp = 0;
x = 0;
y = 0;
curr = 1000000;
bt = 1000000;
d_safe = 0;
transmission = 0;
broadcast = 0;
max = 0;

fprintf('start\n');
% Initialize TraCI
traci.init();

for i = 1: duration
    
    % perform a simulation step
    traci.simulationStep();
    fprintf('interation %d\n',i);
    
    if breakflag == 0
        traci.vehicle.setStop('0', '60787472');
    end
    
    if  traci.vehicle.isStopped('0') ==1 && breakflag == 0
        stopflag = 1;
        breakflag = 1;
        curr =  traci.simulation.getCurrentTime();
        fprintf('breakdown time = %d\n',curr);
        broadcast = broadcast + 1;
    end
    
    if i >= curr/1000
        temp = c1;
        vehicles = traci.vehicle.getIDList();
        breakdown_car = traci.vehicle.getPosition('0');
        speed = traci.vehicle.getSpeed('0');
        
        c1 = 0;
        c2 = 0;
        
        road = traci.vehicle.getRoadID('0');
        lane = traci.vehicle.getLaneIndex('0');
        pos = traci.vehicle.getLanePosition('0');
        
        for j = 2:length(vehicles)
            
            position = traci.vehicle.getPosition(vehicles{j});
            d = distance(position(1),position(2),breakdown_car(1),breakdown_car(2));
            d_safe = dsafe(speed);
            
            if d < 80
                if  traci.vehicle.getTypeID(vehicles{j}) == 49
                    c1 = c1 + 1;
                elseif  traci.vehicle.getTypeID(vehicles{j}) == 50 || traci.vehicle.getTypeID(vehicles{j}) == 51
                    
                    e = traci.vehicle.getRoadID(vehicles{j});
                    if d < d_safe && strcmp(e,road)==1
                        deg = degree(breakdown_car(1),breakdown_car(2),position(1),position(2),x,y);
                        if abs(deg) <= 90
                            c2 = c2 + 1;
                        end
                    end
                end
            end
        end
        if c1 > max  %find one burst
           max = c1;
        end
            
        if c1 > 0 && stopflag==1 && breakflag == 1
            traci.vehicle.resume('0');
            fprintf('resume 0\n');
            stopflag = 0;
            breakflag = 2;
        end
        
        if c1 == 0 && stopflag == 0
            fprintf('stop\n');
            stopflag = 1;
            isresume = 0;
            if c2 > 0 && int8(speed) ~= 0
                fprintf('collision\n');
                traci.close();
            end
            
            traci.vehicle.setSpeedMode('0', 0);
            traci.vehicle.setSpeed('0', 0);
            traci.simulationStep();
            traci.vehicle.setStop('0',road,pos,lane);
            
            
        elseif c1 > 0 && stopflag == 1 && i >= bt/1000
            traci.vehicle.setSpeed('0', -1);
            traci.vehicle.resume('0');
            fprintf('resume\n');
            stopflag = 0;
            isresume = 1;
            mul = 0;
            bt = 1000000;
        end
        
        if int8(speed) == 0 || (int8(speed) ~= 0 && temp > c1)
            broadcast = broadcast + 1*10;
        end
        if stopflag == 0 && int8(speed) ~= 0 % not meet red light
            transmission = transmission + c1*10;
        end
        
        x = breakdown_car(1);
        y = breakdown_car(2);
        
    end
    
    if  traci.vehicle.isStopped('0') == 1 && stopflag == 1 && isresume == 0 && mul==0
        bt =  traci.simulation.getCurrentTime();
        fprintf('breakdown time 2 = %d\n',bt);
        mul = 1;
    end
    
    fprintf('transmission overhead = %d\n',transmission);
    fprintf('broadcast overhead = %d\n',broadcast);
    fprintf('max burst = %d\n',max);
    
end
traci.close();


