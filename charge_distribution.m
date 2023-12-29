function [x, q] = charge_distribution(a, b, h, sigma, N)
% Funkcja oblicza rozkład ładunku na obiekcie trapezowym
% o podstawach a i b, wysokości h, z jednorodną gęstością powierzchniową sigma.
% N to liczba dyskretnych elementów, na które podzielony jest ładunek.

% Sprawdzanie poprawności argumentów wejściowych
arguments
    a (1,1) double {mustBePositive, mustBeFinite}
    b (1,1) double {mustBePositive, mustBeFinite}
    h (1,1) double {mustBePositive, mustBeFinite}
    sigma (1,1) double {mustBeFinite}
    N (1,1) double {mustBeInteger, mustBePositive}
end

% Obliczenie długości górnej krawędzi trapezu
dlugosc_gornej_krawedzi = (a + b) / 2;

% Dyskretyzacja górnej krawędzi na N równych segmentów
dx = dlugosc_gornej_krawedzi / (N - 1);
x = linspace(0, dlugosc_gornej_krawedzi, N);

% Przyjmujemy równomierny rozkład ładunku dla uproszczenia
% Dla bardziej skomplikowanych rozkładów, obliczenie q należy odpowiednio zmodyfikować
q = sigma * dx * ones(1, N); % Ładunek na segment

end
