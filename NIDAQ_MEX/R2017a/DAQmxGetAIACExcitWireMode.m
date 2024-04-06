% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIACExcitWireMode(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIACExcitWireMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIACExcitWireMode', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIACExcitWireMode', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIACExcitWireMode', taskHandle, channel, data);
end
