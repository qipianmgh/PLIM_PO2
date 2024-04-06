% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILVDTUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILVDTUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILVDTUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILVDTUnits', taskHandle, channel);
end
