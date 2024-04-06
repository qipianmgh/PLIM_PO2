% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = lockMex()
    narginchk(0, 0);
    nargoutchk(1, 1);
    [status]= mexNIDAQmx('lockMex');
end
