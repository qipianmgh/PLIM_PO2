% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetSampClkDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSampClkDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetSampClkDigFltrTimebaseSrc', taskHandle, data);
end
