% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteRegenMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteRegenMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWriteRegenMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteRegenMode', taskHandle, data);
end
