% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetHshkDelayAfterXfer(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetHshkDelayAfterXfer', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetHshkDelayAfterXfer', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetHshkDelayAfterXfer', taskHandle, data);
end
