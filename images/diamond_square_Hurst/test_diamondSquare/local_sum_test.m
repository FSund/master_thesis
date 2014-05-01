% test fancy local sum via cumsum thing

csum = cumsum(f); 

disp('cumsum:')
disp(csum); 

add = -1; 
subt = 0; 

pad = max(abs([add, subt])); 

c = padarray(csum, [0, pad]);
% disp(['padded cumsum: ' str(c)]);
disp('padded cumsum:')
disp(c)


left = c((1+pad+add):(end-pad+add)); 
disp('left:')
disp(left); 
right = c((1+pad+subt):(end-pad+subt)); 
disp('right:')
disp(right); 

ans = left-right; 
disp('padded ans:')
disp(ans); 

disp('ans:')
disp(ans((pad):(end-pad)))
