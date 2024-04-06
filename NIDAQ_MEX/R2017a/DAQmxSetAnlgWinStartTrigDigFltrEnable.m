% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigDigFltrEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinStartTrigDigFltrEnable', taskHandle, data);
end
