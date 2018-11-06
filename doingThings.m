%%send the values to csv
%and plot them
clear battery_data;
%battery data will have the time, battery voltage, battery current and the battery power for each time step on the
%simulink, you only need to run it once after the simulation, and all the
%data will be exported to csv
battery_data = [];
for i = 1:size(tout)
    battery_data = [battery_data;tout(i) battery_voltage.Data(i) battery_current.Data(i) battery_current.Data(i)*battery_voltage.Data(i)];
end
csvwrite('battery.csv',battery_data);
