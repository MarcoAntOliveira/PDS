import numpy as np
import matplotlib.pyplot as plt

# Definindo um sinal de exemplo: soma de duas senoides
Fs = 500  # Frequência de amostragem
T = 1/Fs  # Intervalo de amostragem
t = np.arange(0, 1, T)  # Vetor de tempo
f1 = 50  # Frequência da primeira senoide
f2 = 120  # Frequência da segunda senoide
signal = 0.7 * np.sin(2 * np.pi * f1 * t) + np.sin(2 * np.pi * f2 * t)

# Aplicando a FFT
N = len(signal)
fft_result = np.fft.fft(signal)
fft_freq = np.fft.fftfreq(N, T)

# Apenas o espectro positivo
positive_freq = fft_freq[:N//2]
magnitude = np.abs(fft_result[:N//2])

# Plotando o sinal original e sua FFT
plt.figure(figsize=(12, 6))

# Sinal no tempo
plt.subplot(1, 2, 1)
plt.plot(t, signal)
plt.title('Sinal no Tempo')
plt.xlabel('Tempo (s)')
plt.ylabel('Amplitude')

# Magnitude da FFT
plt.subplot(1, 2, 2)
plt.stem(positive_freq, magnitude, use_line_collection=True)
plt.title('Espectro de Frequências')
plt.xlabel('Frequência (Hz)')
plt.ylabel('Magnitude')
plt.grid(True)

plt.tight_layout()
plt.show()
