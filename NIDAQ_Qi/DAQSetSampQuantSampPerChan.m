% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetSampQuantSampPerChan(taskHandle, data)
status = DAQmxSetSampQuantSampPerChan(taskHandle, uint64(data));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampQuantSampPerChan', 'taskHandle', 1);
%     validateattributes(data, {'uint64'}, {'scalar'}, 'DAQmxSetSampQuantSampPerChan', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetSampQuantSampPerChan', taskHandle, data);
end
