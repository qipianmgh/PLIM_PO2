% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetRefTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigType', taskHandle, data);
end
