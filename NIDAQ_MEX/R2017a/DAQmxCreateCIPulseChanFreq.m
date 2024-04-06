% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIPulseChanFreq(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIPulseChanFreq', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanFreq', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanFreq', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanFreq', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanFreq', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIPulseChanFreq', 'units', 6);
    [status]= mexNIDAQmx('DAQmxCreateCIPulseChanFreq', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units);
end
