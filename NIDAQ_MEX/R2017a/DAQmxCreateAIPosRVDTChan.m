% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    narginchk(13, 13);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosRVDTChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIPosRVDTChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'units', 6);
    validateattributes(sensitivity, {'double'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'sensitivity', 7);
    validateattributes(sensitivityUnits, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'sensitivityUnits', 8);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'voltageExcitSource', 9);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'voltageExcitVal', 10);
    validateattributes(voltageExcitFreq, {'double'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'voltageExcitFreq', 11);
    validateattributes(ACExcitWireMode, {'int32'}, {'scalar'}, 'DAQmxCreateAIPosRVDTChan', 'ACExcitWireMode', 12);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateAIPosRVDTChan', 'customScaleName', 13);
    [status]= mexNIDAQmx('DAQmxCreateAIPosRVDTChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName);
end
