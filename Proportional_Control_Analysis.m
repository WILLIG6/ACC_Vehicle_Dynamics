% Proportional Control Analysis Test

% Define the plant parameters
tau = 0.5;  % Time constant of the plant
kp_values = [0.5, 1, 2]; % Different proportional gains to analyse

% Plant transfer function definition
P = tf(1, [tau 1]); % P(s) = 1 / (tau*s + 1)

% Create a figure to compare responses
figure;
hold on; % Allow multiple plots on the same figure

% Loop through different kp values
for kp = kp_values
    % Define the proportional controller
    C = kp; % Simple proportional control
    
    % Closed-loop system
    CL = feedback(C * P, 1); % Feedback system: G(s) = C(s)*P(s) / (1 + C(s)*P(s))
    
    % Step response
    step(CL); % Plot the step response for each kp
end

% Add legend and labels
title('Proportional Control: Step Responses for Different Gains');
xlabel('Time ');
ylabel('Speed (m/s)');
legend('k_p = 0.5', 'k_p = 1', 'k_p = 2');
grid on;
