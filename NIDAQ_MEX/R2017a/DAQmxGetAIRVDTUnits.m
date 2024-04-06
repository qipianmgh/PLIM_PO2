% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIRVDTUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIRVDTUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIRVDTUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIRVDTUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIRVDTUnits', taskHandle, channel, data);
end
