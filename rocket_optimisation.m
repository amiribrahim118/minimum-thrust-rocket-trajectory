%% Minimum-Thrust Planar Rocket Trajectory
% Euler-Lagrange derived trajectory and thrust profile

clear; clc; close all;

%% Parameters

L = 1000;      % final horizontal distance [m]
H = 500;       % final altitude [m]
g = 9.81;      % gravitational acceleration [m/s^2]

%% Optimal flight time

T = (36*(L^2 + H^2)/g^2)^(1/4);

fprintf('Optimal flight time T = %.4f s\n', T);

%% Time vector

N = 1000;
t = linspace(0, T, N);

%% Optimal trajectory

x = L*(3*(t.^2/T^2) - 2*(t.^3/T^3));
y = H*(3*(t.^2/T^2) - 2*(t.^3/T^3));

%% Velocity

xdot = L*(6*t/T^2 - 6*t.^2/T^3);
ydot = H*(6*t/T^2 - 6*t.^2/T^3);

%% Acceleration

xddot = L*(6/T^2 - 12*t/T^3);
yddot = H*(6/T^2 - 12*t/T^3);

%% Thrust acceleration

ux = xddot;
uy = yddot + g;

u_mag = sqrt(ux.^2 + uy.^2);

%% Cost calculation

J_numerical = trapz(t, ux.^2 + uy.^2);

J_analytical = (4*sqrt(6)/3)*g^(3/2)*(L^2 + H^2)^(1/4);

fprintf('Numerical cost J      = %.6f\n', J_numerical);
fprintf('Analytical cost J_min = %.6f\n', J_analytical);
fprintf('Absolute error        = %.6e\n', abs(J_numerical - J_analytical));

%% Plot 1: Trajectory

figure;
plot(x, y, 'LineWidth', 2);
grid on;
axis equal;
xlabel('Horizontal position x [m]');
ylabel('Altitude y [m]');
title('Optimal Planar Rocket Trajectory');

%% Plot 2: Position versus time

figure;
plot(t, x, 'LineWidth', 2);
hold on;
plot(t, y, 'LineWidth', 2);
grid on;
xlabel('Time t [s]');
ylabel('Position [m]');
title('Position Components Over Time');
legend('x(t)', 'y(t)', 'Location', 'best');

%% Plot 3: Velocity versus time

figure;
plot(t, xdot, 'LineWidth', 2);
hold on;
plot(t, ydot, 'LineWidth', 2);
grid on;
xlabel('Time t [s]');
ylabel('Velocity [m/s]');
title('Velocity Components Over Time');
legend('dx/dt', 'dy/dt', 'Location', 'best');

%% Plot 4: Thrust components

figure;
plot(t, ux, 'LineWidth', 2);
hold on;
plot(t, uy, 'LineWidth', 2);
grid on;
xlabel('Time t [s]');
ylabel('Thrust acceleration [m/s^2]');
title('Thrust Acceleration Components');
legend('u_x(t)', 'u_y(t)', 'Location', 'best');

%% Plot 5: Thrust magnitude

figure;
plot(t, u_mag, 'LineWidth', 2);
grid on;
xlabel('Time t [s]');
ylabel('||u(t)|| [m/s^2]');
title('Thrust Acceleration Magnitude');

%% Save figures automatically

saveas(1, 'trajectory.png');
saveas(2, 'position_vs_time.png');
saveas(3, 'velocity_vs_time.png');
saveas(4, 'thrust_components.png');
saveas(5, 'thrust_magnitude.png');