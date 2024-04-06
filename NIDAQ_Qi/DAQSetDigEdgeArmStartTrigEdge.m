% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetDigEdgeArmStartTrigEdge(taskHandle, data)
status = DAQmxSetDigEdgeArmStartTrigEdge(taskHandle, int32(data));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigEdge', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDigEdgeArmStartTrigEdge', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetDigEdgeArmStartTrigEdge', taskHandle, data);
end
