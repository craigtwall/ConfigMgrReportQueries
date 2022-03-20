/*  Configuration Manager SQL Query: Obtain computer info with device hash for Autopilot use
    Created by: Craig Wall
    Twitter: @craigtwall

    Blog Post For Explanation:
    https://craigtwall.com/configmgr-report-autopilot-info-listing-computer-name-serial-number-and-hardware-hash/

*/

SELECT v_GS_SYSTEM.ResourceID AS [v_GS_SYSTEM ResourceID],
    v_GS_SYSTEM.Name0,
    v_GS_MDM_DEVDETAIL_EXT01.ResourceID AS [v_GS_MDM_DEVDETAIL_EXT01 ResourceID],
    v_GS_MDM_DEVDETAIL_EXT01.DeviceHardwareData0,
    v_GS_SYSTEM_ENCLOSURE.ResourceID AS [v_GS_SYSTEM_ENCLOSURE ResourceID],
    v_GS_SYSTEM_ENCLOSURE.SerialNumber0
FROM v_GS_SYSTEM
    INNER JOIN v_GS_MDM_DEVDETAIL_EXT01 ON v_GS_SYSTEM.ResourceID = v_GS_MDM_DEVDETAIL_EXT01.ResourceID
    INNER JOIN v_GS_SYSTEM_ENCLOSURE ON v_GS_SYSTEM.ResourceID = v_GS_SYSTEM_ENCLOSURE.ResourceID
WHERE (v_GS_SYSTEM.Name0 like 'LAPTOP%')