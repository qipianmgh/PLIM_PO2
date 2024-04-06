% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIPulseChanTime(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIPulseChanTime', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanTime', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanTime', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanTime', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanTime', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIPulseChanTime', 'units', 6);
    [status]= mexNIDAQmx('DAQmxCreateCIPulseChanTime', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units);
end
