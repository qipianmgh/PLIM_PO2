% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc', taskHandle, data);
end
