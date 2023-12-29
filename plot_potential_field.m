function plot_potential_field(X, Y, V, a, b, h)
    % Tworzy wykres rozkładu potencjału elektrycznego oraz rysuje trapez.
    % X, Y - macierze współrzędnych siatki
    % V - macierz wartości potencjału
    % a, b, h - wymiary trapezu

    figure;
    % Rysowanie rozkładu potencjału
    contourf(X, Y, V, 50, 'LineColor', 'none');
    colormap('jet'); % Ustawienie mapy kolorów
    colorbar; % Dodanie paska kolorów do wykresu
    title('Rozkład potencjału elektrycznego');
    xlabel('x [m]');
    ylabel('y [m]');

    % Rysowanie trapezu
    hold on;
    trapez_x = [-a/2, a/2, b/2, -b/2, -a/2];
    trapez_y = [0, 0, h, h, 0];
    plot(trapez_x, trapez_y, 'k-', 'LineWidth', 2);
    hold off;
end
