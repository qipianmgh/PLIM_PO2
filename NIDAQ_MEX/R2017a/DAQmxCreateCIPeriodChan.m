% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCIPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCIPeriodChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCIPeriodChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'units', 6);
    validateattributes(edge, {'int32'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'edge', 7);
    validateattributes(measMethod, {'int32'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'measMethod', 8);
    validateattributes(measTime, {'double'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'measTime', 9);
    validateattributes(divisor, {'uint32'}, {'scalar'}, 'DAQmxCreateCIPeriodChan', 'divisor', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCIPeriodChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateCIPeriodChan', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName);
end
