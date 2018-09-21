# matlab2python
Examples of Matlab &ge; R2018b calling Python functions.
Uses the new R2018b `memoryview` to efficiently transfer large variables without copying, as Matlab R2014b..R2018a had required.

## Setup

Matlab R2018b
[supports Python versions]([supports Python versions](https://www.mathworks.com/help/matlab/matlab_external/system-requirements-for-matlab-engine-for-python.html)) 
2.7, 3.5 and 3.6.
Thus you may need to setup Python 3.6 if your usual workflow is with Python 3.7 etc.

1. create Python 3.6 virtual environment (assuming Anaconda Python)
   ```sh
   conda create -n py36 python=3.6
   ```
2. set Matlab to Python 3.6 by restarting Matlab and then in Matlab
   ```matlab
   pyversion ~/miniconda3/envs/py36/bin/python
   ```
3. verify Matlab Python config by typing `pyversion`:
   ```
        version: '3.6'
    executable: '~/miniconda3/envs/py36/bin/python'
       library: '~/miniconda3/envs/py36/lib/libpython3.6m.so'
          home: '~/miniconda3/envs/py36'
      isloaded: 0
   ```

## Notes

### Unsupported Python version errors

If you use an unsupported version of Python, like Python 3.7 with Matlab R2018b, you may get errors like

>  Python Error: ModuleNotFoundError: No module named 'libmwbuffer'
Python function '' might not be able to accept at least one input argument at position 1. The function may
require a specific data type that you can construct from the MATLAB array. For more information, see the
documentation for Python function '' and working with Python arrays.

Solution is to select a supported Python version as detailed above.
