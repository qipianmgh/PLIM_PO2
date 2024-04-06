% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILVDTUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILVDTUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILVDTUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAILVDTUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILVDTUnits', taskHandle, channel, data);
end
