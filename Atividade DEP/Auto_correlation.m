function Rxx = Auto_correlation_function(x,dt)
    N = length(x);
    tau_vector = -N/2:N/2-1;
    Rxx = zeros(1,N);
    for l=1:N
        tau = tau_vector(l);
        x_tau = zeros(1,N+abs(tau));
        if (tau>=0)
            x_tau(1+tau:N+tau) = x;
        else
            x_tau(-tau+1:N-tau) = x;
            % tau é <0, Exemplo: tau = -3, x_tau(3:N+3-1)
        end
        %numerical integration
        for n=1:N
            Rxx(l) = Rxx(l) + x(n)*x_tau(n);
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