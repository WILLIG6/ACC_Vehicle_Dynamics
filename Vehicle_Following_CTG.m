% Vehicle Following with Constant Time Gap Strategy

% Define parameters for CTG
h = 1.5; % Time gap (seconds)
lambda = 0.8; % Control gain

% Spacing error transfer function definition
numerator = [1 lambda];
denominator = [h 1 lambda];
H = tf(numerator, denominator); % Transfer function H(s)

% Simulate the impulse response to analyse stability
figure;
impulse(H); % Impulse response of H(s)
title('CTG Strategy: Impulse Response');
xlabel('Time ');
ylabel('Spacing Error');
grid on;

% Plot Bode plot to check string stability
figure;
bode(H);
title('CTG Strategy: Bode Plot');
grid on;
