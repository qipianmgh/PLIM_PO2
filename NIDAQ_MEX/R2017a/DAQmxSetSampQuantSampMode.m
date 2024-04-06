% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampQuantSampMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampQuantSampMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampQuantSampMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampQuantSampMode', taskHandle, data);
end
