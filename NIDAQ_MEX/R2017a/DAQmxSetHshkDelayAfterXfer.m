% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetHshkDelayAfterXfer(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetHshkDelayAfterXfer', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetHshkDelayAfterXfer', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetHshkDelayAfterXfer', taskHandle, data);
end
