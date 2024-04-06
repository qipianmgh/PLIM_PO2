% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    narginchk(11, 11);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'units', 6);
    validateattributes(voltageExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'voltageExcitSource', 7);
    validateattributes(voltageExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'voltageExcitVal', 8);
    validateattributes(voltageExcitFreq, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'voltageExcitFreq', 9);
    validateattributes(ACExcitWireMode, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'ACExcitWireMode', 10);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIPosRVDTChan', 'customScaleName', 11);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIPosRVDTChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName);
end
