% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCalUserDefinedInfo(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSetCalUserDefinedInfo', 'deviceName', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCalUserDefinedInfo', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetCalUserDefinedInfo', deviceName, data);
end
