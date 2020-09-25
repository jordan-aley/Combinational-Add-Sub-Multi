
function ALEY_SUBTRACTOR
in_file = fopen('ALEY_SUBTRACTOR_INPUT.txt','w');
out_file = fopen('ALEY_SUBTRACTOR_EXP_OUTPUT.txt','w');

for d = 0:2
    if d == 0
        for q = -8388608:-8388599
            a = dec2twos(q,24);
            if rem(q,2) == 0
                j = q/2;
            else
                j = q+4194304;
            end
            b = dec2twos(j,24);
            k = q-j;
            f = dec2twos(k,24);
            line = [a ' ' b];
            fprintf(in_file,'%s\r\n',line);
            fprintf(out_file,'%s\r\n',f);
        end
    elseif d == 1
        for q = -10:9
            a = dec2twos(q,24);
            j = 0;
            b = dec2twos(j,24);
            k = q-j;
            f = dec2twos(k,24);
            line = [a ' ' b];
            fprintf(in_file,'%s\r\n',line);
            fprintf(out_file,'%s\r\n',f);
        end
    else
        for q = 8388598:8388607
            a = dec2twos(q,24);
            j = q/2;
            b = dec2twos(j,24);
            k = q-j;
            f = dec2twos(k,24);
            line = [a ' ' b];
            fprintf(in_file,'%s\r\n',line);
            fprintf(out_file,'%s\r\n',f);
        end
    end
end
    