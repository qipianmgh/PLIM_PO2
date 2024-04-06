% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadDevsWithInsertedOrRemovedAccessories(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadDevsWithInsertedOrRemovedAccessories', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetReadDevsWithInsertedOrRemovedAccessories', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetReadDevsWithInsertedOrRemovedAccessories', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetReadDevsWithInsertedOrRemovedAccessories', taskHandle, data, bufferSize);
end
