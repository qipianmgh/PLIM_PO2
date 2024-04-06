% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
    narginchk(10, 10);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmcplChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmcplChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'units', 6);
    validateattributes(thermocoupleType, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'thermocoupleType', 7);
    validateattributes(cjcSource, {'int32'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'cjcSource', 8);
    validateattributes(cjcVal, {'double'}, {'scalar'}, 'DAQmxCreateAIThrmcplChan', 'cjcVal', 9);
    validateattributes(cjcChannel, {'char'}, {'vector'}, 'DAQmxCreateAIThrmcplChan', 'cjcChannel', 10);
    [status]= mexNIDAQmx('DAQmxCreateAIThrmcplChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel);
end
