% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinPauseTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigCoupling', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigCoupling', taskHandle, data);
end
