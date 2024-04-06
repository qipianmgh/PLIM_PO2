% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevPXIChassisNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevPXIChassisNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevPXIChassisNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevPXIChassisNum', device, data);
end
