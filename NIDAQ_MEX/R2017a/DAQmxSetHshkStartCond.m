% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetHshkStartCond(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetHshkStartCond', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetHshkStartCond', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetHshkStartCond', taskHandle, data);
end
