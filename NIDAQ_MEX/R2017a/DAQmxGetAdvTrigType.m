% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAdvTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAdvTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAdvTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAdvTrigType', taskHandle, data);
end
