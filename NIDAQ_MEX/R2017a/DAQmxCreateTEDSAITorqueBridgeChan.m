% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAITorqueBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'voltageExcitVal', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAITorqueBridgeChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAITorqueBridgeChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName);
end
