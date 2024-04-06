% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetSampClkTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSampClkTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetSampClkTimebaseSrc', taskHandle, data);
end
