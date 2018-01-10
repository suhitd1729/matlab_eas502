function [lam, u] = DominantEigen(A, startvector, k)
for i = 1:k
    u = startvector/norm(startvector);
    startvector = A*u;
    lam = u'*startvector;
end
end