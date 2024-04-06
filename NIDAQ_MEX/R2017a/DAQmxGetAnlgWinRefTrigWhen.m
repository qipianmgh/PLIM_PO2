% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigWhen', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigWhen', taskHandle, data);
end
