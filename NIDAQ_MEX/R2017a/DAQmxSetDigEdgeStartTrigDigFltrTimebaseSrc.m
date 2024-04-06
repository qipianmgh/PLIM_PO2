% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc', taskHandle, data);
end
