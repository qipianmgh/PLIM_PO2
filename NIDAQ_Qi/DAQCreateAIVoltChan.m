function status = DAQCreateAIVoltChan(taskHandle, physicalChannel, Voltrange)
status = DAQmxCreateAIVoltageChan(taskHandle, physicalChannel,' ',DAQmx_Val_Cfg_Default,Voltrange(1),Voltrange(2),DAQmx_Val_Volts,' ');
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
end

