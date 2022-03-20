/*  Configuration Manager SQL Query: Return Devices Without a Specific App Installed, With The Device's Primary User
    Created by: Craig Wall
    Twitter: @craigtwall

    Blog Post For Explanation:
    https://craigtwall.com/building-sccm-sql-query-return-users-without-specific-software-installed-on-any-of-their-primary-devices/

*/


SELECT DISTINCT OS.Netbios_Name0 as 'ComputerID',
    ROM.User_Name0 as 'User Name'
FROM v_GS_ADD_REMOVE_PROGRAMS as CS
    INNER JOIN v_R_System_Valid as OS on CS.ResourceID = OS.ResourceID
    INNER JOIN v_UsersPrimaryMachines as RAM on CS.ResourceID = RAM.MachineID
    INNER JOIN v_R_User as ROM on RAM.UserResourceID = ROM.ResourceID
WHERE OS.Netbios_Name0 not in (
        SELECT distinct CS.Netbios_Name0 as 'ComputerID'
        FROM v_R_System_Valid as CS
            INNER JOIN v_GS_ADD_REMOVE_PROGRAMS as ROM on ROM.ResourceID = CS.ResourceID
        WHERE ROM.DisplayName0 = 'Zoom'
    )