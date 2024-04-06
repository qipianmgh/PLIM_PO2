function status = DAQCreateCOPulseChanFreq(taskHandle, counter, initialDelay, freq, dutyCycle)
status = DAQmxCreateCOPulseChanFreq(taskHandle,counter,' ',DAQmx_Val_Hz,DAQmx_Val_Low,initialDelay,freq,dutyCycle);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end

%     narginchk(8, 8);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'taskHandle', 1);
%     validateattributes(counter, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanFreq', 'counter', 2);
%     validateattributes(nameToAssignToChannel, {'char'}, {'vector'}, 'DAQmxCreateCOPulseChanFreq', 'nameToAssignToChannel', 3);
%     validateattributes(units, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'units', 4);
%     validateattributes(idleState, {'int32'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'idleState', 5);
%     validateattributes(initialDelay, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'initialDelay', 6);
%     validateattributes(freq, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'freq', 7);
%     validateattributes(dutyCycle, {'double'}, {'scalar'}, 'DAQmxCreateCOPulseChanFreq', 'dutyCycle', 8);
%     [status]= mexNIDAQmx('DAQmxCreateCOPulseChanFreq', taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle);
end


