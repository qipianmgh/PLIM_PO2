% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinRefTrigTop(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigTop', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigTop', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigTop', taskHandle, data);
end
