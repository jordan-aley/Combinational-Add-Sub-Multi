function ALEY_MULTIPLIER
in_file = fopen('ALEY_MULTIPLIER_INPUT.txt','w');
out_file = fopen('ALEY_MULTIPLIER_EXP_OUTPUT.txt','w');

for d = -2896:2895
    a = dec2twos(d,24);
    if rem(d,2)==0
        j = (d*-1)/2;
    elseif d < 0
        j = d+1448;
    else
        j = d-1448;
    end
    b = dec2twos(j,24);
    k = d*j;
    f = dec2twos(k,24);
    line = [a ' ' b];
    fprintf(in_file,'%s\r\n',line);
    fprintf(out_file,'%s\r\n',f);
end