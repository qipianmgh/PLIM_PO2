% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCompactDAQSlotNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCompactDAQSlotNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevCompactDAQSlotNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCompactDAQSlotNum', device, data);
end
