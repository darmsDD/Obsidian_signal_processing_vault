function Rxx = Auto_correlation_function(x,dt)
    N = length(x);
    tau_vector = -N/2:N/2-1;
    Rxx = zeros(1,N);
    for l=1:N
        tau = tau_vector(l);
        %numerical integration
        for n=1:N
            if(n+tau>0 && n+tau<=N)
                Rxx(l) = Rxx(l) + x(n)*x(n+tau);
            end
        end
        T = N*dt;
        % 1/T * dt * Rxx(l); = 1/(N*dt) * dt * Rxx(l) = 1/N *Rxx(l)
        Rxx(l) = 1/N * Rxx(l);
    end
end
%x=randn(1,6);
%tau = 2;
%dt=1e-3;
%a = Auto_correlation_function(x,dt);