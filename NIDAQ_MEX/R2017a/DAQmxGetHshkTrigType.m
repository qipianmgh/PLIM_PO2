% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetHshkTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetHshkTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetHshkTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetHshkTrigType', taskHandle, data);
end
