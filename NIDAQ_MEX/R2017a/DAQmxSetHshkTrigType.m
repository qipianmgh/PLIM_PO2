% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetHshkTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetHshkTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetHshkTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetHshkTrigType', taskHandle, data);
end
