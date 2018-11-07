%%send the values to csv
%and plot them
clear battery_data;
clear battery_charging;
clear battery_discharging;
clear battery_stable;
%battery data will have the time, battery voltage, battery current and the battery power for each time step on the
%simulink, you only need to run it once after the simulation, and all the
%data will be exported to csv
battery_data = [];
battery_charging = [];
battery_discharging = [];
battery_stable = [];
for i = 1:size(tout)
    battery_data = [battery_data;tout(i) battery_voltage.Data(i) battery_current.Data(i) battery_current.Data(i)*battery_voltage.Data(i)];
    if battery_current.Data(i) > 0
        battery_charging = [battery_charging;tout(i) battery_voltage.Data(i) battery_current.Data(i) battery_current.Data(i)*battery_voltage.Data(i)];
    end
    if battery_current.Data(i) < 0
        battery_discharging = [battery_discharging;tout(i) battery_voltage.Data(i) battery_current.Data(i) battery_current.Data(i)*battery_voltage.Data(i)];
    end
    if abs(battery_current.Data(i)) < 0.1
        battery_stable = [battery_stable;tout(i) battery_voltage.Data(i) battery_current.Data(i) battery_current.Data(i)*battery_voltage.Data(i)];
    end
end
csvwrite('battery.csv',battery_data);
csvwrite('battery_charging.csv',battery_charging);
csvwrite('battery_discharging.csv',battery_discharging);
csvwrite('battery_stable.csv',battery_stable);

