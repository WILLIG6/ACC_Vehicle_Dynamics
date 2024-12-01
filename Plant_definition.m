% Cruise Control Simulation Test

% Plant Definition

% Define the plant parameters
tau = 0.5;  % Time constant of the plant
kp = 1;     % Proportional gain

% Plant transfer function definition
P = tf(1, [tau 1]); % Transfer function: P(s) = 1 / (tau*s + 1)

% Proportional controller definition
C = kp; 

% Closed-loop system
CL = feedback(C * P, 1); % Feedback system: G(s) = C(s)*P(s) / (1 + C(s)*P(s))

% Simulate the system response to a step input
figure;
step(CL); % Step response
title('Cruise Control: Step Response');
xlabel('Time ');
ylabel('Speed (m/s)');
grid on;
