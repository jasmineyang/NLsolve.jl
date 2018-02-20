function fixedpoint(f, x0; residualnorm = (x -> norm(x,Inf)), tol = 1E-10, maxiter=100)    
    residual = Inf
    iter = 1
    xold = x0
    while residual > tol && iter < maxiter
        xnew = f(xold)        
        residual = residualnorm(xold - xnew);
        xold = xnew
        iter += 1
    end
    return (xold,iter)
end

function fixedpoint!(f!, x0; residualnorm = (x -> norm(x,Inf)), tol = 1E-10, maxiter=100)    
    residual = Inf
    iter = 1
    xold = x0
    xnew = copy(x0)
    while residual > tol && iter < maxiter
        f!(xold, xnew)        
        residual = residualnorm(xold - xnew);
        xold = copy(xnew)
        iter += 1
    end
    return (xold,iter)
end
