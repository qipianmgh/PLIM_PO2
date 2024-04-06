% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgLvlPauseTrigLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigLvl', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigLvl', taskHandle, data);
end
