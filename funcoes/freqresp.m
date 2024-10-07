function [H] = freqresp(b, a, w)
    % Frequency response function from difference equation
    % [H] = freqresp(b, a, w)
    % H = frequency response array evaluated at w frequencies
    % b = numerator coefficient array
    % a = denominator coefficient array (a(1) = 1)
    % w = frequency location array

    % Verify that a(1) is equal to 1, normalize if necessary
    if a(1) ~= 1
        a = a / a(1);
        b = b / a(1);
    end
    
    % Compute the frequency response for each frequency in w
    H = zeros(size(w)); % Initialize the frequency response array
    
    for i = 1:length(w)
        % Evaluate the frequency response at each frequency w(i)
        z = exp(-1j * w(i)); % Complex exponential for current frequency
        
        % Calculate numerator (b coefficients) and denominator (a coefficients)
        num = polyval(b, z); % Evaluates the polynomial with b coefficients
        den = polyval(a, z); % Evaluates the polynomial with a coefficients
        
        % Calculate the frequency response H at this frequency
        H(i) = num / den;
    end
end
