% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIACExcitWireMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIACExcitWireMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIACExcitWireMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIACExcitWireMode', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIACExcitWireMode', taskHandle, channel, data);
end
