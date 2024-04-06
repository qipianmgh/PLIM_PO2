% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate', taskHandle, data);
end
