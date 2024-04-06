% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIPressureBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'voltageExcitVal', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPressureBridgeChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIPressureBridgeChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName);
end
