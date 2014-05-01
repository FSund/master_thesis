function test(f)

dim = sum(size(f) > 1);
fprintf('dim = %d\n', dim);

if (dim == 1)
    disp('hei')
    for i=1:10
        a = 0;
        for j=1:length(f)
            a = a + f(j);
        end
%         a = sum(f);
    end
elseif (dim == 2)
    disp('hallo')
    [n,m] = size(f);
    for i=1:10
        a = 0;
        for j=1:n
            for k=1:m
                a = a + f(j);
            end
        end
    end
end
