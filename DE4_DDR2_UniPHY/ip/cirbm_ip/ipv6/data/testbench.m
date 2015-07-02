f = fopen('bin.dat');
line = fgetl(f);
i = 1;
while ischar(line)
     data(i,:) = fgetl(f);
     ++i;
end

data