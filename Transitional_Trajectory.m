% Transitional Trajectory Simulation

% Define parameters
x0 = 100; % Initial position (meters)
v0 = 30;  % Initial velocity (m/s)
a = -3.5; % Deceleration (m/s^2) - negative for slowing down

% Time vector
t = linspace(0, 10, 100); % Time from 0 to 10 seconds

% Deceleration Profile (Parabolic Trajectory)
x = x0 + v0 * t + 0.5 * a * t.^2;

% Switching Line
v_final = 10; % Desired final velocity (m/s)
switching_time = (v_final - v0) / a; % Time to reach final velocity
x_switch = x0 + v0 * switching_time + 0.5 * a * switching_time^2;

% Plot the results
figure;
plot(t, x, 'b', 'LineWidth', 1.5); hold on;
plot(switching_time, x_switch, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
title('Transitional Trajectory: Deceleration Profile');
xlabel('Time (seconds)');
ylabel('Position (meters)');
legend('Trajectory', 'Switching Point');
grid on;
