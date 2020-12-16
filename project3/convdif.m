function unew = convdif(u,a,d,dt)
N = length(u);
deltaX = 1/N;
C = [-2 1 zeros(1,N-3) 1];
R = [-2 1 zeros(1,N-3) 1]';
Tdx = toeplitz(C,R)./(deltaX^2);

C2 = [0 1 zeros(1,N-3) -1]; %-1 is there to be our repeating boundary condition
R2 = [0 -1 zeros(1,N-3) 1]'; %as is 1
Sdx = toeplitz(C2,R2)./(2*deltaX);

%below is my dumb way of doing this, might be a bit more clear what is
%happening, the bounds are the repeating boundary conditions but i think
%its more tidy above

% C = [-2 1 zeros(1,N-3)]./(deltaX^2);
% R = [-2 1 zeros(1,N-3)]'./(deltaX^2);
% 
% boundC = 1*d/(deltaX^2) - a*1/(2*deltaX);
% boundR = 1*d/(deltaX^2) + a*1/(2*deltaX);
% C = [C boundC];
% R = [R ; boundR];
% Tdx = toeplitz(C,R);
% 
% C2 = [0 1 zeros(1,N-2)]./(2*deltaX);
% R2 = [0 -1 zeros(1,N-2)]./(2*deltaX)';
unew = TRstep(d.*Tdx-a.*Sdx,u,dt);
end