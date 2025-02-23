import numpy as np
import matplotlib.pyplot as plt

y = np.random.randn(2, 1)
x = np.zeros((2,5))

plt.plot(y)
plt.show()

# %%
def myprint(msg):
    print("Dum", msg)
myprint("Cell 1")

# %%
print("Cell 2")
