% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigLvl', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigLvl', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigLvl', taskHandle, data);
end
