# Installation
## Setup conda environment
The following Python packages are used by ``Molten``:
```
conda create -n nvim python=3.11 
conda activate nvim
pip install --upgrade pynvim
pip install jupyter-client
pip install pnglatex
pip install cairosvg
pip install plotly
pip install kaleido
pip install pyperclip
pip install nbformat
pip install pillow
````
After installation of ``Molten`` run ``:UpdateRemotePlugin''.
*Image Nvim setup*
Need
```
sudo dnf install ImageMagick-devel
sudo dnf install ImageMagick
```
## Create conda kernel for new enviroments
To make a kernel that can be used by ``Molten``, 
```
conda activate myenv
pip install ipykernel
python -m ipykernel install --user --name=myenv --display-name="Python (myenv)"
```
# Using Molten 
For connecting kernel with jupyter console:
```
jupyter console env=myenv -f /tmp/kernel.json
```
Then in ``nvim``:
```
:MoltenInit /tmp/kernel.json
```

