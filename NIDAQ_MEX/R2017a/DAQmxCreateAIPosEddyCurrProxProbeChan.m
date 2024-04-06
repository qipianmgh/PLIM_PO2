% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPosEddyCurrProxProbeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'units', 6);
    validateattributes(sensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'sensitivity', 7);
    validateattributes(sensitivityUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'sensitivityUnits', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPosEddyCurrProxProbeChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateAIPosEddyCurrProxProbeChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName);
end
