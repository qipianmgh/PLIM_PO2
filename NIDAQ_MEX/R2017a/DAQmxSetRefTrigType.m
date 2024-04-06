% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRefTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetRefTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRefTrigType', taskHandle, data);
end
