# matlab2python

Examples of Matlab &ge; R2018b calling Python functions with `memoryview` to efficiently transfer large variables without copying in memory, unlike older Matlab versions.

## Setup

Matlab [supports calling Python functions](https://www.mathworks.com/help/matlab/matlab_external/system-requirements-for-matlab-engine-for-python.html).

If you use an unsupported version of Python, errors will occur like

>  Python Error: ModuleNotFoundError: No module named 'libmwbuffer'
Python function '' might not be able to accept at least one input argument at position 1. The function may
require a specific data type that you can construct from the MATLAB array. For more information, see the
documentation for Python function '' and working with Python arrays.

Solution is to select a Matlab-supported Python version.
