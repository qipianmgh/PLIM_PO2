% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIACExcitWireMode(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIACExcitWireMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIACExcitWireMode', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIACExcitWireMode', taskHandle, channel);
end
