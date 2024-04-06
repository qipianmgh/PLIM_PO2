% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinRefTrigWhen(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigWhen', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigWhen', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigWhen', taskHandle, data);
end
