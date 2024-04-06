% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIFreqChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIFreqChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIFreqChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'units', 6);
    validateattributes(edge, {'int32'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'edge', 7);
    validateattributes(measMethod, {'int32'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'measMethod', 8);
    validateattributes(measTime, {'double'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'measTime', 9);
    validateattributes(divisor, {'uint32'}, {'scalar'}, 'DAQmxCreateCIFreqChan', 'divisor', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCIFreqChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateCIFreqChan', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName);
end
