Config                            = {}

------------------ the last gear allways need to be 0.90!!!!!--------------------------------
------------------ gear ratios from 1 to 6 gears vehicle are native GTA V gear ratios and i create the other -------
------------------ in config.vehicles you can add more gear ratios for specified vehicles ---
------------------ gear up = shift / controller A , gear down = r / controller B ------------
------------------ Lscustom  transmission upgrade adds another Gear to the vehicle ----------

Config.gears = {
    [1] = {0.90},--1
    [2] = {3.33, 0.90},--2
    [3] = {3.33, 1.57, 0.90},--3
    [4] = {3.33, 1.83, 1.22, 0.90},--4
    [5] = {3.33, 1.92, 1.36, 1.05, 0.90},--5
    [6] = {3.33, 1.95, 1.39, 1.09, 0.95, 0.90},--6
    [7] = {4.00, 2.34, 1.67, 1.31, 1.14, 1.08, 0.90},--7
    [8] = {5.31, 3.11, 2.22, 1.74, 1.51, 1.43, 1.20, 0.90},--8
    [9] = {7.70, 4.51, 3.22, 2.52, 2.20, 2.08, 1.73, 1.31, 0.90},--9
    [10] = {7.70, 4.51, 3.22, 2.52, 2.20, 2.08, 1.73, 1.31, 0.90, 0.71}--10
}

Config.vehicles = {

                                            --Police Pack (Start)--    
    [GetHashKey('kcso11vic')] = { 
        ["gears"] = {2.84, 1.55, 1.00, 0.70}, ["handlingDefaults"] = {df=0.140, idmv=156.8500000}, ["downShiftAtWot"] = {dsaw=0.50}, ["isAuto"] = true -- Ford 4R75E
    },
    [GetHashKey('kcso18charger')] = { 
        ["gears"] = {3.59, 2.18, 1.40, 1.00, 0.833}, ["handlingDefaults"] = {df=0.1540, idmv=187.0000000}, ["downShiftAtWot"] = {dsaw=0.55}, ["isAuto"] = true -- Dodge W5A580
    },

    [GetHashKey('kcso14charger')] = { 
        ["gears"] = {3.59, 2.18, 1.40, 1.00, 0.833}, ["handlingDefaults"] = {df=0.1560, idmv=187.0000000}, ["downShiftAtWot"] = {dsaw=0.55}, ["isAuto"] = true -- Dodge W5A580
    }, 

    [GetHashKey('kcso19f150')] = { 
        ["gears"] = {4.69, 2.98, 2.14, 1.76, 1.52, 1.27, 1.00, 0.85, 0.68, 0.63}, ["handlingDefaults"] = {df=0.1750, idmv=145.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Ford 10R80
    },

    [GetHashKey('kcso20explorer')] = { 
        ["gears"] = {4.69, 2.98, 2.14, 1.76, 1.52, 1.27, 1.00, 0.85, 0.68, 0.63}, ["handlingDefaults"] = {df=0.1455, idmv=178.0000000}, ["downShiftAtWot"] = {dsaw=0.68}, ["isAuto"] = true -- Ford 10R80
    }, 

    [GetHashKey('kcso16explorer')] = { 
        ["gears"] = {4.484, 2.872, 1.842, 1.414, 1.00, 0.742}, ["handlingDefaults"] = {df=0.1455, idmv=181.00000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Ford 6F50
    },

    [GetHashKey('kcso13explorer')] = { 
        ["gears"] = {4.484, 2.872, 1.842, 1.414, 1.00, 0.742}, ["handlingDefaults"] = {df=0.1525, idmv=178.00000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Ford 6F50
    }, 

    [GetHashKey('kcso15expedition')] = { 
        ["gears"] = {4.17, 2.33, 1.52, 1.14, 0.86, 0.69}, ["handlingDefaults"] = {df=0.1680, idmv=137.00000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Ford 6F50
    }, 

    [GetHashKey('kcso18taurus')] = { 
        ["gears"] = {4.17, 2.33, 1.52, 1.14, 0.86, 0.69}, ["handlingDefaults"] = {df=0.158, idmv=181.00000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Ford 6F50
    },

    [GetHashKey('kcso19tahoe')] = { 
        ["gears"] = {4.02, 2.36, 1.53, 1.15, 0.85, 0.66}, ["handlingDefaults"] = {df=0.156, idmv=168.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Chevrolet 6L80
    },

    [GetHashKey('kcso21tahoe')] = { 
        ["gears"] = {4.69, 2.98, 2.14, 1.76, 1.52, 1.27, 1.00, 0.85, 0.68, 0.63}, ["handlingDefaults"] = {df=0.139, idmv=168.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Chevrolet 10L80
    },
                                            --Police Pack (End)--

                                       --Personal Police Cars (Start)--

    [GetHashKey('polredeye')] = { 
        ["gears"] = {4.714, 3.143, 2.106, 1.667, 1.285, 1.000, 0.839, 0.667}, ["handlingDefaults"] = {df=0.1760, idmv=245.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Dodge W5A580
    },

    [GetHashKey('polcharg')] = { 
        ["gears"] = {4.714, 3.143, 2.106, 1.667, 1.285, 1.000, 0.839, 0.667}, ["handlingDefaults"] = {df=0.1760, idmv=245.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Dodge W5A580
    },

    [GetHashKey('poltrx')] = { 
        ["gears"] = {4.714, 3.143, 2.106, 1.667, 1.285, 1.000, 0.839, 0.667}, ["handlingDefaults"] = {df=0.1960, idmv=142.3100000}, ["downShiftAtWot"] = {dsaw=0.65}, ["isAuto"] = true -- Dodge W5A580
    },

                                        --Personal Police Cars (End)--      

    [GetHashKey('sbus2')] = { 
        ["gears"] = {3.49, 1.86, 1.41, 1.00, 0.75, 0.65}, ["handlingDefaults"] = {df=0.10, idmv=79.0000000}, ["downShiftAtWot"] = {dsaw=0.60}, ["isAuto"] = true -- Allison 3000 Series
    },     
                                            
}


Config.enginebrake = true -- brakes the car if you downshift the wrong way


Config.gearhud = 2 -- if 1 - show gear / if 2 show gear and km/h and Rpm from 0 to 1 / if 0 disable hud

