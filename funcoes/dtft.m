function X = dtft(x, n, w)
    X = zeros(size(w)); 
    for k = 1:length(w)
        X(k) = sum(x .* exp(-1j * w(k) * n)); 
    end
end