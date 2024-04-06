% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIResistanceChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIResistanceChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'units', 6);
    validateattributes(resistanceConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'resistanceConfig', 7);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'currentExcitSource', 8);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIResistanceChan', 'currentExcitVal', 9);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIResistanceChan', 'customScaleName', 10);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIResistanceChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName);
end
