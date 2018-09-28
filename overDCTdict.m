function [D, op] = overDCTdict(n,L)
%
%  Returns the DCT dictionary of size nxL
%  
    D = zeros(n,L);
    D(:,1) = 1/sqrt(n);
    for k = 2:L
        v = cos((0:n-1)*pi*(k-1)/L)';
        v = v-mean(v);
        D(:,k) = v/norm(v);
    end
    
    op = [];
    for l = 1:sqrt(L)
        op1 = []; 
        for k = 1:sqrt(L)
            op1 = [op1;reshape(D(:,k),sqrt(n),sqrt(n))];
        end
        op = [op,op1];
    end
    op = (op-min(op(:)))/(max(op(:))-min(op(:)));
	%Uncomment todisplay DCT dict
    %imshow(op);%tif
    %colormap('gray');
end 