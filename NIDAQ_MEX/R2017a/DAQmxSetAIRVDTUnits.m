% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRVDTUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRVDTUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRVDTUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIRVDTUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRVDTUnits', taskHandle, channel, data);
end
