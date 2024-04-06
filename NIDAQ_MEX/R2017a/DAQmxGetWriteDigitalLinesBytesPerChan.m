% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteDigitalLinesBytesPerChan(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteDigitalLinesBytesPerChan', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWriteDigitalLinesBytesPerChan', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteDigitalLinesBytesPerChan', taskHandle, data);
end
