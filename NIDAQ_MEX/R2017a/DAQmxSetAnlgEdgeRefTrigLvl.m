% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeRefTrigLvl(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigLvl', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigLvl', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeRefTrigLvl', taskHandle, data);
end
