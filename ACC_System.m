% Adaptive Cruise Control (ACC) System

%% Define Plant and Speed Control 
tau = 0.5; % Plant time constant
kp = 1;    % Proportional gain
ki = 0.5;  % Integral gain
P = tf(1, [tau 1]); % Plant transfer function

% PI Controller
C_PI = tf([kp ki], [1 0]); % C(s) = (kp*s + ki) / s

% Closed-loop system for speed control
CL_SpeedControl = feedback(C_PI * P, 1);

%% Vehicle Following (CTG Strategy)
h = 1.5; % Time gap (seconds)
lambda = 0.8; % Control gain

% CTG Transfer Function for spacing error
H_CTG = tf([1 lambda], [h 1 lambda]);

%% Transitional Trajectory
x0 = 100; % Initial position (meters)
v0 = 30;  % Initial velocity (m/s)
a = -3.5; % Deceleration (m/s^2)
v_final = 10; % Desired final velocity (m/s)
switching_time = (v_final - v0) / a; % Time to reach final velocity
t_traj = linspace(0, 10, 100); % Time vector

% Deceleration profile for position
x_traj = x0 + v0 * t_traj + 0.5 * a * t_traj.^2;

%% Simulation and Visualisation

% Speed Control Step Response
figure;
step(CL_SpeedControl);
title('ACC System: Speed Control Response');
xlabel('Time ');
ylabel('Speed (m/s)');
grid on;

% CTG Impulse Response
figure;
impulse(H_CTG);
title('ACC System: CTG Impulse Response');
xlabel('Time ');
ylabel('Spacing Error');
grid on;

% Transitional Trajectory
figure;
plot(t_traj, x_traj, 'b', 'LineWidth', 1.5); hold on;
plot(switching_time, x_traj(find(t_traj >= switching_time, 1)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
title('ACC System: Transitional Trajectory');
xlabel('Time (seconds)');
ylabel('Position (meters)');
legend('Trajectory', 'Switching Point');
grid on;
