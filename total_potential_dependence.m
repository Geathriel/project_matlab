function [r_values, V_total] = total_potential_dependence(a, b, h, sigma, k, r_max, N)
% Oblicza zależność całkowitego potencjału od odległości od trapezu.
% a, b, h, sigma - parametry trapezu
% k - stała Coulomba
% r_max - maksymalna odległość dla analizy
% N - liczba punktów do analizy

r_values = linspace(0, r_max, N);
V_total = zeros(size(r_values));

for i = 1:length(r_values)
    [positions, charges] = charge_distribution(a, b, h, sigma, N);
    V_total(i) = electric_potential(r_values(i), 0, charges, positions, k);
end

% Wykres zależności potencjału od odległości
figure;
plot(r_values, V_total);
title('Zależność potencjału od odległości');
xlabel('Odległość [m]');
ylabel('Potencjał [V]');

end
