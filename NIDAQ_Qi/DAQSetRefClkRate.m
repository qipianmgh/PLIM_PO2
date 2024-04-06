% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetRefClkRate(taskHandle, data)
status = DAQmxSetRefClkRate(uint64(taskHandle), data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefClkRate', 'taskHandle', 1);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetRefClkRate', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetRefClkRate', taskHandle, data);
end
