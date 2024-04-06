% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgWinRefTrigSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgWinRefTrigSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigSrc', taskHandle, data);
end
