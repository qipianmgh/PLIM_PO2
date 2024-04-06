% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRefTrigAutoTrigEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefTrigAutoTrigEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetRefTrigAutoTrigEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRefTrigAutoTrigEnable', taskHandle, data);
end
