function taskHandle = DAQCreateTask(taskName)
[status, taskHandle] = daq.ni.NIDAQmx.DAQmxCreateTask( taskName, uint64(0) );
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end
