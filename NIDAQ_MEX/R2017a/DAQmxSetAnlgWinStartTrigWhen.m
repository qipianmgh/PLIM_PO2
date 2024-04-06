% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinStartTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgWinStartTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinStartTrigWhen', taskHandle, data);
end
