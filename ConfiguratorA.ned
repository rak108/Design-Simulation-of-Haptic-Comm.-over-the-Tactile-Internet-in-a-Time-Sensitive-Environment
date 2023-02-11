//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.mp;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100G;
import inet.node.ethernet.EthernetSwitch;
import inet.node.tsn.TsnSwitch;
import inet.node.tsn.TsnDevice;
import inet.node.tsn.TsnRouter;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;


network ConfiguratorA
{
    @display("bgb=1610.5125,874.96497");
    submodules:
        configurator: Ipv4NetworkConfigurator {
            parameters:
            	@display("p=100,100");
            	addStaticRoutes = true;
        }
        robotController: TsnDevice {
            @display("p=268.32748,417.6225");
        }
        host1: TsnDevice {
            @display("p=227.9775,542.7075");
        }
        host2: TsnDevice {
            @display("p=268.32748,736.3875");
        }
        host3: TsnDevice {
            @display("p=667.7925,98.8575");
        }
        router0: TsnRouter {
            @display("p=667.7925,574.9875");
        }
        router2: TsnRouter {
            @display("p=972.435,574.9875");
        }
        router1: TsnRouter {
            @display("p=821.1225,369.20248");
        }
        host4: TsnDevice {
            @display("p=843.315,70.612495");
        }
        host5: TsnDevice {
            @display("p=972.435,98.8575");
        }
        host6: TsnDevice {
            @display("p=1430.4075,417.6225");
        }
        host7: TsnDevice {
            @display("p=1472.775,542.7075");
        }
        robotArm: TsnDevice {
            @display("p=1430.4075,736.3875");
        }
        switch0: TsnSwitch {
            @display("p=518.4975,574.9875");
        }
        switch2: TsnSwitch {
            @display("p=1162.08,574.9875");
        }
        switch1: TsnSwitch {
            @display("p=821.1225,225.95999");
        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=98.8575,209.81999");
        }
    connections:
        host2.ethg++ <--> Eth100G <--> switch0.ethg++;
        host1.ethg++ <--> Eth100G <--> switch0.ethg++;
        robotController.ethg++ <--> Eth100G <--> switch0.ethg++;
        switch0.ethg++ <--> Eth100G <--> router0.ethg++;
        router0.ethg++ <--> Eth100G <--> router1.ethg++;
        router1.ethg++ <--> Eth100G <--> switch1.ethg++;
        switch1.ethg++ <--> Eth100G <--> host3.ethg++;
        switch1.ethg++ <--> Eth100G <--> host4.ethg++;
        switch1.ethg++ <--> Eth100G <--> host5.ethg++;
        router1.ethg++ <--> Eth100G <--> router2.ethg++;
        router2.ethg++ <--> Eth100G <--> switch2.ethg++;
        switch2.ethg++ <--> Eth100G <--> host6.ethg++;
        switch2.ethg++ <--> Eth100G <--> host7.ethg++;
        switch2.ethg++ <--> Eth100G <--> robotArm.ethg++;
        router0.ethg++ <--> Eth100G <--> router2.ethg++;
}
