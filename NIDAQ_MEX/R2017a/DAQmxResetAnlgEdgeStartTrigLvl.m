% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeStartTrigLvl(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeStartTrigLvl', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeStartTrigLvl', taskHandle);
end
