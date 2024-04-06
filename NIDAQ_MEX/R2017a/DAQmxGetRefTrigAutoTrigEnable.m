% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigAutoTrigEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigAutoTrigEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRefTrigAutoTrigEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigAutoTrigEnable', taskHandle, data);
end
