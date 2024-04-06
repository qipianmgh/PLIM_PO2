% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSwitchSetTopologyAndReset(deviceName, newTopology)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxSwitchSetTopologyAndReset', 'deviceName', 1);
    validateattributes(newTopology, {'char'}, {'vector'}, 'DAQmxSwitchSetTopologyAndReset', 'newTopology', 2);
    [status]= mexNIDAQmx('DAQmxSwitchSetTopologyAndReset', deviceName, newTopology);
end
