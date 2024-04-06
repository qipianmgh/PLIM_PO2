% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadOffset(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadOffset', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetReadOffset', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadOffset', taskHandle, data);
end
