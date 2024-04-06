% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQCfgImplicitTiming(taskHandle, sampleMode, sampsPerChan)

status = DAQmxCfgImplicitTiming(taskHandle, sampleMode, sampsPerChan);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgImplicitTiming', 'taskHandle', 1);
%     validateattributes(sampleMode, {'int32'}, {'scalar'}, 'DAQmxCfgImplicitTiming', 'sampleMode', 2);
%     validateattributes(sampsPerChan, {'uint64'}, {'scalar'}, 'DAQmxCfgImplicitTiming', 'sampsPerChan', 3);
%     [status]= mexNIDAQmx('DAQmxCfgImplicitTiming', taskHandle, sampleMode, sampsPerChan);
end
