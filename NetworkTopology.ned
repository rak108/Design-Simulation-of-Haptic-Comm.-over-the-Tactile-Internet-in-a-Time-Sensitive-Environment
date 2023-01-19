//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package nesting.simulations.major_project;

import ned.DatarateChannel;
import nesting.node.ethernet.VlanEtherHostQ;
import nesting.node.ethernet.VlanEtherHostSched;
import nesting.node.ethernet.VlanEtherSwitchPreemptable;
import inet.node.inet.Router; // TODO: Look if there's TSN based alternative


network NetworkTopology
{
    types:
        channel C extends DatarateChannel
        {
            delay = 0.1us;
            datarate = 1Gbps;
        }
    submodules:
        switchA: VlanEtherSwitchPreemptable {
            parameters:
                @display("p=123,146");
            gates:
                ethg[4];
        }
        switchB: VlanEtherSwitchPreemptable {
            parameters:
                @display("p=275,146");
            gates:
                ethg[3];
        }
        switchC: VlanEtherSwitchPreemptable {
            parameters:
                @display("p=437,161");
            gates:
                ethg[4];
        }
        workstation1: VlanEtherHostQ {
            @display("p=123,239");
        }
        workstation2: VlanEtherHostQ {
            @display("p=191,300");
        }
        workstation5: VlanEtherHostQ {
            @display("p=357,306");
        }
        robotController: VlanEtherHostSched {
            @display("p=56,300");
        }
        roboticArm: VlanEtherHostQ {
            @display("p=503,316");
        }
        workstation6: VlanEtherHostQ {
            @display("p=437,267");
        }
        workstation3: VlanEtherHostQ {
            @display("p=230,200");
        }
        workstation4: VlanEtherHostQ {
            @display("p=333,210");
        }
        routerA: Router {
            @display("p=123,70");
        }
        routerB: Router {
            @display("p=275,58");
        }
        routerC: Router {
            @display("p=443,70");
        }
    connections:
        robotController.ethg <--> C <--> switchA.ethg[0];
        workstation1.ethg <--> C <--> switchA.ethg[1];
        workstation2.ethg <--> C <--> switchA.ethg[2];

        workstation3.ethg <--> C <--> switchB.ethg[0];
        workstation4.ethg <--> C <--> switchB.ethg[1];

        roboticArm.ethg <--> C <--> switchC.ethg[0];
        workstation5.ethg <--> C <--> switchC.ethg[1];
        workstation6.ethg <--> C <--> switchC.ethg[2];
        
        routerA.ethg[0] <--> C <--> switchA.ethg[3];
        routerB.ethg[0] <--> C <--> switchB.ethg[2];
        routerC.ethg[0] <--> C <--> switchC.ethg[3];
        
        // TODO: Figure out the channel that should be used
        routerA.pppg[0] <--> C <--> routerB.pppg[0];
        routerB.pppg[0] <--> C <--> routerC.pppg[0];
}
