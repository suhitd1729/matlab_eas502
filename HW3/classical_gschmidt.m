function [Q,R] = classical_gschmidt(A)
    [m,n] = size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for k = 1:n
        Q(:,k) = A(:,k);
        if k ~= 1
            R(1:k-1,k) = Q(:,k-1)'*Q(:,k);
            Q(:,k) = Q(:,k) - Q(:,1:k-1)*R(1:k-1,k);
        end
        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k)/R(k,k);
     end
end





