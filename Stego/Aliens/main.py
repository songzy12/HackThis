import wave
import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    filename = "crypt6.wav"
    f = wave.open(filename, "rb")
    nchannels, sampwidth, framerate, nframes, comptype, compname = f.getparams()
    frames = f.readframes(nframes)
    frames = np.fromstring(frames, dtype=np.short)

    assert(nchannels == 2)
    frames.shape = -1, 2
    wave_data = frames.T
    wave_time = np.arange(0, nframes) * (1.0 / framerate)

    plt.subplot(211)
    plt.plot(wave_time, wave_data[0], color='green')
    plt.subplot(212)
    plt.plot(wave_time, wave_data[1])

    plt.savefig("wave.png")
