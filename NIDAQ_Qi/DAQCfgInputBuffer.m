% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQCfgInputBuffer(taskHandle, numSampsPerChan)
status = DAQmxCfgInputBuffer(taskHandle, numSampsPerChan);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxCfgInputBuffer', 'taskHandle', 1);
%     validateattributes(numSampsPerChan, {'uint32'}, {'scalar'}, 'DAQmxCfgInputBuffer', 'numSampsPerChan', 2);
%     [status]= mexNIDAQmx('DAQmxCfgInputBuffer', taskHandle, numSampsPerChan);
end