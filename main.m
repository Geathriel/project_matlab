% main.m
% Główny skrypt do obliczenia i wizualizacji rozkładu potencjału elektrycznego dla naładowanego trapezu

% Parametry trapezu i ładunku
a = 5; % długość krótszej podstawy trapezu
b = 10; % długość dłuższej podstawy trapezu
h = 7; % wysokość trapezu
sigma = 1e-9; % jednorodna gęstość powierzchniowa ładunku [C/m^2]
k = 8.9875517873681764e9; % stała Coulomba [Nm^2/C^2]

% Parametry dyskretyzacji ładunku i przestrzeni
N_charges = 100; % liczba dyskretnych ładunków na trapezie
x_range = linspace(-15, 15, 100); % zakres x do analizy pola
y_range = linspace(0, 15, 50); % zakres y do analizy pola

% Obliczenie rozkładu ładunku
[positions, charges] = charge_distribution(a, b, h, sigma, N_charges);

% Przygotowanie siatki współrzędnych
[X, Y] = meshgrid(x_range, y_range);

% Inicjalizacja macierzy potencjału
V = zeros(size(X));

% Obliczenie potencjału dla każdego punktu siatki
for ix = 1:length(x_range)
    for iy = 1:length(y_range)
        V(iy, ix) = electric_potential(x_range(ix), y_range(iy), charges, positions, k);
    end
end

% Wywołanie funkcji do wygenerowania wykresu potencjału
plot_potential_field(X, Y, V, a, b, h);

% Obliczenie pola elektrycznego
[Ex, Ey] = electric_field(x_range, y_range, charges, positions, k);

% Wykres linii pola elektrycznego
figure;
quiver(X, Y, Ex, Ey);
title('Linie natężenia pola elektrycznego');
xlabel('x [m]');
ylabel('y [m]');

% Analiza zależności potencjału od sposobu podziału
[p_divisions, p_values] = potential_dependence(a, b, h, sigma, k, 0, 0);

% Wykres zależności potencjału od sposobu podziału
figure;
plot(p_divisions, p_values);
title('Zależność potencjału od sposobu podziału');
xlabel('Liczba podziałów');
ylabel('Potencjał [V]');

% Analiza zależności całkowitego potencjału od odległości
r_max = 20; % maksymalna odległość analizy [m]
[r_values, V_total] = total_potential_dependence(a, b, h, sigma, k, r_max, N_charges);

% Wykres zależności całkowitego potencjału od odległości
figure;
plot(r_values, V_total);
title('Całkowity potencjał w funkcji odległości od trapezu');
xlabel('Odległość [m]');
ylabel('Potencjał [V]');
