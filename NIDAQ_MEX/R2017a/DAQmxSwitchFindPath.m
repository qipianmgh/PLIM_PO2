% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, path, pathStatus] = DAQmxSwitchFindPath(switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
    narginchk(5, 5);
    nargoutchk(3, 3);
    validateattributes(switchChannel1, {'char'}, {'vector'}, 'DAQmxSwitchFindPath', 'switchChannel1', 1);
    validateattributes(switchChannel2, {'char'}, {'vector'}, 'DAQmxSwitchFindPath', 'switchChannel2', 2);
    validateattributes(path, {'char'}, {'vector'}, 'DAQmxSwitchFindPath', 'path', 3);
    validateattributes(pathBufferSize, {'uint32'}, {'scalar'}, 'DAQmxSwitchFindPath', 'pathBufferSize', 4);
    validateattributes(pathStatus, {'int32'}, {'vector'}, 'DAQmxSwitchFindPath', 'pathStatus', 5);
    [status, path, pathStatus]= mexNIDAQmx('DAQmxSwitchFindPath', switchChannel1, switchChannel2, path, pathBufferSize, pathStatus);
end
