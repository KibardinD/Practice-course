    % Constants %
beta1 = 1;
h = 0.001;
T = 0;

    % Variables %
N = 1000;
x1 = zeros(1,N);
x2 = zeros(1,N);
x1(1) = input('Input initial value of the prey population: '); 
x2(1) = input('Input initial value of the predator population: '); 
x1_star = input('Input target: ');
t = 1:N;
answer = [];

    % Functions %
psi = @(x1)(x1 - x1_star); %target
 
    % Calculations%
fprintf('\n\n\tOutput\nAvailable coefficients:\n');
figure;
for alpha2 = 0.1:0.1:10
    for beta2 = 0.1:0.1:10
        % Functions %
        f1 = @(x1)(-psi(x1)*(T+1)/h);
        f2 = @(x1,x2)(-alpha2*x2 + beta2*x1*x2);
        % Euler Method %
        for i = 1:N-1
            x1(i+1) = x1(i) + h*f1(x1(i));
            x2(i+1) = x2(i) + h*f2(x1(i),x2(i));
        end
        % Sustainability %
        check = Sustainability(x1(N),x2(N),x1_star,x2(1));
        if check == 1
            fprintf('alpha2 = %.1f, beta2 = %.1f\n', alpha2, beta2);
            answer(end+1) = alpha2;
            answer(end+1) = beta2;
            % Plots %
            hold on;
            plot(t,x1,t,x2);
            legend('Prey','Predator');  
        end
    end
end

    % Check %
if isempty(answer)
    fprintf('None\nThe system is unsustainable\n')
    plot(t,x1,t,x2);
    legend('Prey','Predator');  
else
    fprintf('\nThe system is sustainable\n');
end

function check = Sustainability(x1_last, x2_last, x1_star, x2_first)
    epsilon1 = 0.001;
    epsilon2 = 1000;
    if (abs(x1_last - x1_star) < epsilon1) && (x2_last < epsilon2)
        check = 1;
    else
        check = 0;
    end
end