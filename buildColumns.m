function output = buildColumns(data)

%Data enters as a string of data and we must break into columns

m = length(data);
j = 1;
for i = 1:floor(m/3)
    output(i,:) = data(j:j+2);
    j=3*i+1;
end
