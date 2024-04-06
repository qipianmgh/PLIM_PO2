% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIResistanceChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIResistanceChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'resistanceConfig', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIResistanceChan', 'currentExcitVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIResistanceChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateAIResistanceChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName);
end
