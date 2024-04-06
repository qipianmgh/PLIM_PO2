% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCICountEdgesDirTerm(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesDirTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesDirTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesDirTerm', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCICountEdgesDirTerm', taskHandle, channel, data);
end
