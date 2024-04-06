% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetStartTrigRetriggerable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigRetriggerable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetStartTrigRetriggerable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetStartTrigRetriggerable', taskHandle, data);
end
