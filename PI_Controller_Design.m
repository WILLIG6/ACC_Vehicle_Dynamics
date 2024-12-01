% PI Controller Design and Analysis

% Define plant parameters
tau = 0.5; % Time constant of the plant
kp = 1;    % Proportional gain
ki = 0.5;  % Integral gain

% Define the plant transfer function
P = tf(1, [tau 1]); % P(s) = 1 / (tau*s + 1)

% Define the PI Controller transfer function
C = tf([kp ki], [1 0]); % C(s) = (kp*s + ki) / s

% Closed-loop system with PI Controller
CL_PI = feedback(C * P, 1);

% Simulate the step response of the closed-loop system
figure;
step(CL_PI);
title('PI Controller: Step Response');
xlabel('Time ');
ylabel('Speed (m/s)');
grid on;
