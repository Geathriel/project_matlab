function V = electric_potential(x, y, charge_distribution, positions, k)
% Oblicza potencjał elektryczny w punkcie (x, y)
% na podstawie rozkładu ładunku.
% x, y - współrzędne punktu, w którym obliczany jest potencjał
% charge_distribution - wektor zawierający ładunki
% positions - wektor zawierający położenia ładunków
% k - stała Coulomba

% Inicjalizacja potencjału
V = 0;

% Obliczenie potencjału z superpozycji potencjałów od poszczególnych ładunków
for i = 1:length(charge_distribution)
    r = sqrt((x - positions(i))^2 + y^2);
    V = V + (k * charge_distribution(i)) / r;
end

end
