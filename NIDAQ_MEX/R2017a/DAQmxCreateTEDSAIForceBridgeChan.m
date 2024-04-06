% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIForceBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'voltageExcitVal', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIForceBridgeChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIForceBridgeChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName);
end
