% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateCISemiPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    narginchk(7, 7);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCISemiPeriodChan', 'taskHandle', 1);
    validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCISemiPeriodChan', 'counter', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCISemiPeriodChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateCISemiPeriodChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateCISemiPeriodChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCISemiPeriodChan', 'units', 6);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateCISemiPeriodChan', 'customScaleName', 7);
    [status]= mexNIDAQmx('DAQmxCreateCISemiPeriodChan', taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName);
end
