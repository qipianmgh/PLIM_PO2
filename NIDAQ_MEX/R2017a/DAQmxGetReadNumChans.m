% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadNumChans(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadNumChans', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadNumChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadNumChans', taskHandle, data);
end
