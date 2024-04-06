% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigPretrigSamples(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigPretrigSamples', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRefTrigPretrigSamples', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigPretrigSamples', taskHandle, data);
end
