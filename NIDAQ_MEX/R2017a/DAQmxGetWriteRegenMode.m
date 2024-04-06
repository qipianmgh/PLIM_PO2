% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteRegenMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteRegenMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetWriteRegenMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteRegenMode', taskHandle, data);
end
