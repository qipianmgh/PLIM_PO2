% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
    narginchk(6, 6);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIPulseChanTicks', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanTicks', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanTicks', 'nameToAssignToChannel', 3);
    validateattributes(sourceTerminal, {'char'}, {'vector'}, 'DAQmxCreateCIPulseChanTicks', 'sourceTerminal', 4);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanTicks', 'minVal', 5);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPulseChanTicks', 'maxVal', 6);
    [status]= mexNIDAQmx('DAQmxCreateCIPulseChanTicks', taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal);
end
