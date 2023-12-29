function [Ex, Ey] = electric_field(x_range, y_range, charge_distribution, positions, k)
% Oblicza składowe x i y natężenia pola elektrycznego dla siatki punktów.
% x_range, y_range - zakresy dla siatki punktów
% charge_distribution - wektor ładunków
% positions - wektor położeń ładunków wzdłuż trapezu
% k - stała Coulomba

% Inicjalizacja składowych pola
[Ex, Ey] = deal(zeros(length(y_range), length(x_range)));

% Obliczanie składowych pola elektrycznego
for i = 1:length(x_range)
    for j = 1:length(y_range)
        for n = 1:length(charge_distribution)
            dx = x_range(i) - positions(n);
            dy = y_range(j);
            r = sqrt(dx^2 + dy^2);
            r3 = r^3;
            Ex(j,i) = Ex(j,i) + (k * charge_distribution(n) * dx) / r3;
            Ey(j,i) = Ey(j,i) + (k * charge_distribution(n) * dy) / r3;
        end
    end
end

end
