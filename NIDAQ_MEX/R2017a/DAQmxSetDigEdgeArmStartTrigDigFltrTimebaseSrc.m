% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc', taskHandle, data);
end
