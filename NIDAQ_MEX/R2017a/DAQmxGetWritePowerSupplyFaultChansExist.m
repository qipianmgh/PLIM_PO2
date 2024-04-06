% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWritePowerSupplyFaultChansExist(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWritePowerSupplyFaultChansExist', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWritePowerSupplyFaultChansExist', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWritePowerSupplyFaultChansExist', taskHandle, data);
end
