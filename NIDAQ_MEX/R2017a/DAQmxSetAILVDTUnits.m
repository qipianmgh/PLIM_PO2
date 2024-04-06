% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILVDTUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILVDTUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILVDTUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAILVDTUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILVDTUnits', taskHandle, channel, data);
end
