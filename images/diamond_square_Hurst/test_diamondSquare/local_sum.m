function result = local_sum(f, left, right)

% TODO: ensure f row, not column?

% assert(right >= 0, 'Right (and left) should be positive');
% assert(left >= 0, 'Left (and right) should be positive');

% tic
csum = cumsum(f);

add = right;
subt = -left-1;
npad = max(abs([add, subt]));

c = padarray(csum, [0, npad]);

% fprintf('padded cumsum:\n');
% disp(c);

padded_ans = c((1+npad+add):(end-npad+add)) - c((1+npad+subt):(end-npad+subt));
% toc

% fprintf('padded ans:\n');
% disp(padded_ans);

% if (left > 0 && right > 0)
%     a = max([1+npad+add, 1+npad+subt])
%     b = min([length(c)-npad+add, length(c)-npad+subt]) 
%     result = padded_ans(a:b);

%     result = padded_ans((1+npad-add):(end-npad-subt-1));

    result = padded_ans(1+left:(end-right));
    
% elseif (left == 0 && right == 0)
%     disp('lr == 0');
%     result = padded_ans(npad:(end-npad+1));
%     
% elseif (left == 0)
%     disp('l == 0');
%     result = padded_ans((npad-1):(end-npad));
%     
% elseif (right == 0)
%     disp('r == 0');
%     result = padded_ans(npad:(end-npad+3));
%     
% else
%     disp('???')
% end


% % tic
% start = 1 + left;
% stop = length(f) - right;
% test = zeros([1,length(start:stop)]);
% 
% in = start:stop;
% for counter=1:length(in);
%     i = in(counter);
%     test(counter) = sum(f((i-left):(i+right)));
% end
% % toc
% fprintf('test:\n');
% disp(test);
