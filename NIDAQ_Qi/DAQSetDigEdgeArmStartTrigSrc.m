% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetDigEdgeArmStartTrigSrc(taskHandle, data)
[status, data] = DAQmxSetDigEdgeArmStartTrigSrc(taskHandle, data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigSrc', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetDigEdgeArmStartTrigSrc', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigSrc', taskHandle, data);
end
