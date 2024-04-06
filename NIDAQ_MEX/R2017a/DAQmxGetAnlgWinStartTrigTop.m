% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinStartTrigTop(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinStartTrigTop', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgWinStartTrigTop', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinStartTrigTop', taskHandle, data);
end
