% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRefTrigPretrigSamples(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefTrigPretrigSamples', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetRefTrigPretrigSamples', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRefTrigPretrigSamples', taskHandle, data);
end
