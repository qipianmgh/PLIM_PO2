% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIThrmcplChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIThrmcplChan', 'nameToAssignToChannel', 3);
    validateattributes(minVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'minVal', 4);
    validateattributes(maxVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'maxVal', 5);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'units', 6);
    validateattributes(cjcSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'cjcSource', 7);
    validateattributes(cjcVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIThrmcplChan', 'cjcVal', 8);
    validateattributes(cjcChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIThrmcplChan', 'cjcChannel', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIThrmcplChan', taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel);
end
