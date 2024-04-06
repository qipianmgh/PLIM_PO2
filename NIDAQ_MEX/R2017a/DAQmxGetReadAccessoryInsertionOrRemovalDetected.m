% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadAccessoryInsertionOrRemovalDetected(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadAccessoryInsertionOrRemovalDetected', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetReadAccessoryInsertionOrRemovalDetected', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadAccessoryInsertionOrRemovalDetected', taskHandle, data);
end
