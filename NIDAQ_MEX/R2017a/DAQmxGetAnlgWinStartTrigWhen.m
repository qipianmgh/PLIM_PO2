% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinStartTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinStartTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgWinStartTrigWhen', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinStartTrigWhen', taskHandle, data);
end
