% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevPXISlotNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevPXISlotNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevPXISlotNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevPXISlotNum', device, data);
end
