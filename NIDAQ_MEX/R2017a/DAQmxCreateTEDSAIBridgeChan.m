% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIBridgeChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIBridgeChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIBridgeChan', 'voltageExcitVal', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIBridgeChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIBridgeChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName);
end
