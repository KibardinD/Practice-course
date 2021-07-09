    % Constants %
alpha2 = 10;
beta1 = 0.1;
beta2 = 0.9;
x1_star = input('Input target: ');
h = 0.01;
T = 0;

    % Variables %
N = 1000;
x1 = zeros(1,N);
x2 = zeros(1,N);
u = zeros(1,N);
x1(1) = 1; % initial value of the prey population
x2(1) = 1; % initial value of the predator population
t = 1:N;

    % Calculations%
for i = 1:N-1
    x1(i+1) = x1(i) + h*((T+1)/h*(x1_star - x1(i)));
    x2(i+1) = x2(i) + h*(-alpha2*x2(i) + beta2*x1(i)*x2(i));
    
end

    % Plots %
figure;
hold on;
plot(t,x1,t,x2);
legend('Prey','Predator');  

