% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampQuantSampMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampQuantSampMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampQuantSampMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampQuantSampMode', taskHandle, data);
end
