% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteOvertemperatureChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteOvertemperatureChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteOvertemperatureChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteOvertemperatureChansExist', taskHandle, data);
end
