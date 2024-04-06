% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAdvTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAdvTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAdvTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAdvTrigType', taskHandle, data);
end
