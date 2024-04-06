% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxCreateTEDSAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    narginchk(9, 9);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'taskHandle', 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'physicalChannel', 2);
    validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'nameToAssignToChannel', 3);
    validateattributes(terminalConfig, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'terminalConfig', 4);
    validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'units', 5);
    validateattributes(maxSndPressLevel, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'maxSndPressLevel', 6);
    validateattributes(currentExcitSource, {'int32'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'currentExcitSource', 7);
    validateattributes(currentExcitVal, {'double'}, {'scalar'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'currentExcitVal', 8);
    validateattributes(customScaleName, {'char'}, {'vector'}, 'DAQmxCreateTEDSAIMicrophoneChan', 'customScaleName', 9);
    [status]= mexNIDAQmx('DAQmxCreateTEDSAIMicrophoneChan', taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName);
end
