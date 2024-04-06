% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    narginchk(13, 13);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosLVDTChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosLVDTChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'units', 6);
    validateattributes(sensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'sensitivity', 7);
    validateattributes(sensitivityUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'sensitivityUnits', 8);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'voltageExcitSource', 9);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'voltageExcitVal', 10);
    validateattributes(voltageExcitFreq, {'double'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'voltageExcitFreq', 11);
    validateattributes(ACExcitWireMode, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosLVDTChan', 'ACExcitWireMode', 12);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPosLVDTChan', 'customScaleName', 13);
    [status]= mexNIDAQmx('DAQmxCreateAIPosLVDTChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName);
end
