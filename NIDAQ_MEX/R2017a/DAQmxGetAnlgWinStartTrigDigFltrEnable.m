% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinStartTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgWinStartTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinStartTrigDigFltrEnable', taskHandle, data);
end
