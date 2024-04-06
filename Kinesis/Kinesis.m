NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.dll');
NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericPiezoCLI.dll');

import Thorlabs.MotionControl.DeviceManagerCLI.*
import Thorlabs.MotionControl.GenericPiezoCLI.*
import Thorlabs.MotionControl.Benchtop.PrecisionPiezoCLI.*

DeviceManagerCLI.BuildDeviceList()
a = DeviceManagerCLI.GetDeviceListSize();

disp(a);

device = PrecisionPiezoCLI.CreateBenchtopPiezo('44000151'); %The output of this line must be suppressed
device.Connect('44000151')
device.WaitForSettingsInitialized(5000)

motorSettings = device.GetMotorConfiguration('44000151');
currentDeviceSettings = device.MotorDeviceSettings;

device.StartPolling(250)
device.EnableDevice()
pause(1) %wait to make sure device is enabled

device.Home(60000)

device.MoveTo(10, 60000)

System.Decimal.ToDouble(device.Position)

device.StopPolling()
device.Disconnect()