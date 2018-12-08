%archivo para analisar si deberiamos comprar o vender electricidad
data = dlmread (strcat("PV-EPEX.csv"), ",");
price = data(:,1);
price_mean = mean(price);
price_std = std(price);
minute = data(:,2);
seconds_in_a_year = 365 * 24 * 60 * 60;
seconds_in_15_min = 15*60;
data_seconds = [0 0];

for j = 1:size(price)
    for i = 1:seconds_in_15_min
        data_seconds = [data_seconds;i+((j-1)*seconds_in_15_min) price(j)];
    end
end

