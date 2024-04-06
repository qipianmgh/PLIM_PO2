% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAIDataXferReqCond(taskHandle, channel, data)
status = DAQmxSetAIDataXferReqCond(taskHandle, channel, int32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
    errorString = DAQGetExtendedErrorInfo();
    error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIDataXferReqCond', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIDataXferReqCond', 'channel', 2);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIDataXferReqCond', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAIDataXferReqCond', taskHandle, channel, data);
end

% DAQmx_Val_OnBrdMemMoreThanHalfFull	10237	Transfer data from the device when more than half of the onboard memory of the device fills.
% DAQmx_Val_OnBrdMemNotEmpty	10241	Transfer data from the device when there is data in the onboard memory.
% DAQmx_Val_OnbrdMemCustomThreshold	12577	Transfer data from the device when the number of samples specified with Data Transfer Custom Threshold are in the device FIFO.
% DAQmx_Val_WhenAcqComplete	12546	Transfer data when the acquisition is complete.