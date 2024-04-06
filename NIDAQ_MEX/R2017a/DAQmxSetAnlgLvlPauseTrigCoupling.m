% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgLvlPauseTrigCoupling(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigCoupling', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigCoupling', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigCoupling', taskHandle, data);
end
