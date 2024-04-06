% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigDigFltrEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigDigFltrEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigDigFltrEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigDigFltrEnable', taskHandle, data);
end
