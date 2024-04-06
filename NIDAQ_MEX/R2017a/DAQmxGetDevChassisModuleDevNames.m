% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevChassisModuleDevNames(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevChassisModuleDevNames', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevChassisModuleDevNames', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevChassisModuleDevNames', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevChassisModuleDevNames', device, data, bufferSize);
end
