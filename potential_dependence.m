function [partitions, potentials] = potential_dependence(a, b, h, sigma, k, x, y)
% Analizuje zależność potencjału od liczby podziałów obiektu.
% a, b, h, sigma - parametry trapezu
% k - stała Coulomba
% x, y - współrzędne punktu analizy

% Zakres podziałów do analizy
partitions = 10:10:100;
potentials = zeros(length(partitions), 1);

for i = 1:length(partitions)
    % Obliczenie rozkładu ładunku dla danego podziału
    [pos, charges] = charge_distribution(a, b, h, sigma, partitions(i));
    
    % Obliczenie potencjału dla danego podziału
    potentials(i) = electric_potential(x, y, charges, pos, k);
end

end
