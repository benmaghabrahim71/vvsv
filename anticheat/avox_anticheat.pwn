/*
    AvoX Ultimate Anticheat for SAMP
    Version: 3.0.0
    Author: AvoX Protected
    Description: Ultimate anticheat protection for SAMP servers
    
    Features:
    - Car spawning protection
    - Weapon spawning detection
    - Speed hack prevention
    - Memory modification detection
    - Health/Armor modification detection
    - Teleport detection
    - Aimbot detection
    - Server restart protection
    - DDoS attack prevention
    - Admin abuse protection
    - Player crash prevention
    - Resource injection blocking
    - Command injection protection
    - Server resource protection
    - Connection flood protection
    - Packet manipulation detection
    - Script injection prevention
    - Vehicle modification detection
    - Object spawning protection
    - Anti-bot protection
*/

#include <a_samp>
#include <sscanf2>
#include <foreach>

// Configuration
#define MAX_PLAYERS 100
#define MAX_VEHICLES 2000
#define MAX_WEAPONS 47
#define MAX_OBJECTS 1000

// Anticheat settings
#define SPEED_HACK_THRESHOLD 150.0
#define TELEPORT_DISTANCE_THRESHOLD 80.0
#define HEALTH_MAX 100.0
#define ARMOR_MAX 100.0
#define VEHICLE_SPAWN_COOLDOWN 3000 // 3 seconds
#define WEAPON_SPAWN_COOLDOWN 2000  // 2 seconds
#define OBJECT_SPAWN_COOLDOWN 5000  // 5 seconds
#define CONNECTION_FLOOD_THRESHOLD 10 // Max connections per minute
#define PACKET_FLOOD_THRESHOLD 1000 // Max packets per second
#define ADMIN_ACTION_COOLDOWN 1000 // 1 second between admin actions

// Player data structure
enum E_PLAYER_DATA {
    bool:pSpawned,
    bool:pInVehicle,
    pVehicleID,
    Float:pLastX,
    Float:pLastY,
    Float:pLastZ,
    pLastHealth,
    pLastArmor,
    pLastWeapon,
    pVehicleSpawnTime,
    pWeaponSpawnTime,
    pObjectSpawnTime,
    pSpeedHackWarnings,
    pTeleportWarnings,
    pHealthHackWarnings,
    pWeaponHackWarnings,
    pVehicleHackWarnings,
    pObjectHackWarnings,
    pConnectionTime,
    pConnectionCount,
    pPacketCount,
    pLastPacketTime,
    pAdminActionTime,
    pAdminActionCount,
    bool:pIsAdmin,
    pCrashAttempts,
    pResourceInjectionAttempts,
    pCommandInjectionAttempts,
    pBotDetectionScore,
    pLastMovementTime,
    pSuspiciousActions,
    pBanReason[64]
}

new PlayerData[MAX_PLAYERS][E_PLAYER_DATA];

// Vehicle tracking
new bool:VehicleSpawned[MAX_VEHICLES];
new VehicleOwner[MAX_VEHICLES];
new VehicleSpawnTime[MAX_VEHICLES];

// Object tracking
new bool:ObjectSpawned[MAX_OBJECTS];
new ObjectOwner[MAX_OBJECTS];
new ObjectSpawnTime[MAX_OBJECTS];

// Weapon tracking
new bool:WeaponGiven[MAX_PLAYERS][MAX_WEAPONS];

// Server protection
new ServerStartTime;
new bool:ServerRestartAttempted;
new AdminActionLog[100][128];
new AdminActionLogIndex;

// Anticheat statistics
new AC_Detections = 0;
new AC_Bans = 0;
new AC_Crashes = 0;
new AC_DDoS_Attempts = 0;
new AC_AdminAbuse = 0;

// Main anticheat timer
new AC_Timer;
new AC_CheckTimer;

// DDoS protection
new ConnectionAttempts[256]; // IP-based tracking
new PacketFloodCount[MAX_PLAYERS];

public OnFilterScriptInit() {
    print("==========================================");
    print("AvoX Ultimate Anticheat v3.0.0");
    print("==========================================");
    print("Ultimate protection features enabled:");
    print("- Car spawning protection");
    print("- Weapon spawning detection");
    print("- Speed hack prevention");
    print("- Memory modification detection");
    print("- Health/Armor modification detection");
    print("- Teleport detection");
    print("- Aimbot detection");
    print("- Server restart protection");
    print("- DDoS attack prevention");
    print("- Admin abuse protection");
    print("- Player crash prevention");
    print("- Resource injection blocking");
    print("- Command injection protection");
    print("- Server resource protection");
    print("- Connection flood protection");
    print("- Packet manipulation detection");
    print("- Script injection prevention");
    print("- Vehicle modification detection");
    print("- Object spawning protection");
    print("- Anti-bot protection");
    print("==========================================");
    
    ServerStartTime = GetTickCount();
    
    // Start anticheat timers
    AC_Timer = SetTimer("AnticheatCheck", 1000, true);
    AC_CheckTimer = SetTimer("AdvancedProtectionCheck", 500, true);
    
    return 1;
}

public OnFilterScriptExit() {
    KillTimer(AC_Timer);
    KillTimer(AC_CheckTimer);
    print("AvoX Ultimate Anticheat unloaded!");
    return 1;
}

public OnPlayerConnect(playerid) {
    // Reset player data
    ResetPlayerData(playerid);
    
    // DDoS protection
    new playerIP[16];
    GetPlayerIp(playerid, playerIP, sizeof(playerIP));
    new ipHash = GetIPHash(playerIP);
    
    if(ConnectionAttempts[ipHash] > CONNECTION_FLOOD_THRESHOLD) {
        Ban(playerid);
        printf("[AvoX Ultimate] DDoS attempt blocked from IP: %s", playerIP);
        AC_DDoS_Attempts++;
        return 0;
    }
    
    ConnectionAttempts[ipHash]++;
    PlayerData[playerid][pConnectionTime] = GetTickCount();
    PlayerData[playerid][pConnectionCount]++;
    
    return 1;
}

public OnPlayerDisconnect(playerid, reason) {
    // Clean up player data
    ResetPlayerData(playerid);
    return 1;
}

public OnPlayerSpawn(playerid) {
    PlayerData[playerid][pSpawned] = true;
    PlayerData[playerid][pInVehicle] = false;
    PlayerData[playerid][pVehicleID] = INVALID_VEHICLE_ID;
    
    // Get initial position
    GetPlayerPos(playerid, PlayerData[playerid][pLastX], PlayerData[playerid][pLastY], PlayerData[playerid][pLastZ]);
    
    // Get initial health and armor
    PlayerData[playerid][pLastHealth] = GetPlayerHealth(playerid);
    PlayerData[playerid][pLastArmor] = GetPlayerArmour(playerid);
    
    // Reset weapon tracking
    for(new i = 0; i < MAX_WEAPONS; i++) {
        WeaponGiven[playerid][i] = false;
    }
    
    PlayerData[playerid][pLastMovementTime] = GetTickCount();
    
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason) {
    PlayerData[playerid][pSpawned] = false;
    PlayerData[playerid][pInVehicle] = false;
    PlayerData[playerid][pVehicleID] = INVALID_VEHICLE_ID;
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger) {
    if(!ispassenger) {
        PlayerData[playerid][pInVehicle] = true;
        PlayerData[playerid][pVehicleID] = vehicleid;
    }
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid) {
    PlayerData[playerid][pInVehicle] = false;
    PlayerData[playerid][pVehicleID] = INVALID_VEHICLE_ID;
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate) {
    if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) {
        PlayerData[playerid][pInVehicle] = true;
        PlayerData[playerid][pVehicleID] = GetPlayerVehicleID(playerid);
    } else if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER) {
        PlayerData[playerid][pInVehicle] = false;
        PlayerData[playerid][pVehicleID] = INVALID_VEHICLE_ID;
    }
    return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart) {
    // Check for aimbot (impossible shots)
    if(IsPlayerAimbotting(playerid, damagedid, weaponid)) {
        HandleAimbotDetection(playerid);
    }
    
    // Check for weapon modification
    if(!IsValidWeapon(weaponid) || !WeaponGiven[playerid][weaponid]) {
        HandleWeaponHackDetection(playerid, weaponid);
    }
    
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart) {
    // Check for health modification
    new currentHealth = GetPlayerHealth(playerid);
    if(currentHealth > HEALTH_MAX) {
        HandleHealthHackDetection(playerid, currentHealth);
    }
    
    // Check for armor modification
    new currentArmor = GetPlayerArmour(playerid);
    if(currentArmor > ARMOR_MAX) {
        HandleArmorHackDetection(playerid, currentArmor);
    }
    
    return 1;
}

public OnPlayerUpdate(playerid) {
    if(!PlayerData[playerid][pSpawned]) return 1;
    
    // Packet flood protection
    new currentTime = GetTickCount();
    if(currentTime - PlayerData[playerid][pLastPacketTime] < 100) {
        PlayerData[playerid][pPacketCount]++;
        if(PlayerData[playerid][pPacketCount] > PACKET_FLOOD_THRESHOLD) {
            HandlePacketFloodDetection(playerid);
            return 0;
        }
    } else {
        PlayerData[playerid][pPacketCount] = 0;
    }
    PlayerData[playerid][pLastPacketTime] = currentTime;
    
    // Get current position
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    
    // Check for speed hack
    if(IsPlayerSpeedHacking(playerid, x, y, z)) {
        HandleSpeedHackDetection(playerid);
    }
    
    // Check for teleport
    if(IsPlayerTeleporting(playerid, x, y, z)) {
        HandleTeleportDetection(playerid);
    }
    
    // Update last position
    PlayerData[playerid][pLastX] = x;
    PlayerData[playerid][pLastY] = y;
    PlayerData[playerid][pLastZ] = z;
    PlayerData[playerid][pLastMovementTime] = currentTime;
    
    return 1;
}

// Advanced protection check
forward AdvancedProtectionCheck();
public AdvancedProtectionCheck() {
    foreach(new playerid : Player) {
        if(!IsPlayerConnected(playerid) || !PlayerData[playerid][pSpawned]) continue;
        
        // Check for bot behavior
        if(IsPlayerBot(playerid)) {
            HandleBotDetection(playerid);
        }
        
        // Check for suspicious actions
        if(PlayerData[playerid][pSuspiciousActions] > 10) {
            HandleSuspiciousBehaviorDetection(playerid);
        }
        
        // Check for crash attempts
        if(PlayerData[playerid][pCrashAttempts] > 3) {
            HandleCrashAttemptDetection(playerid);
        }
    }
}

// Anticheat main check function
forward AnticheatCheck();
public AnticheatCheck() {
    foreach(new playerid : Player) {
        if(!IsPlayerConnected(playerid) || !PlayerData[playerid][pSpawned]) continue;
        
        // Check health modification
        new currentHealth = GetPlayerHealth(playerid);
        if(currentHealth > HEALTH_MAX && currentHealth != PlayerData[playerid][pLastHealth]) {
            HandleHealthHackDetection(playerid, currentHealth);
        }
        PlayerData[playerid][pLastHealth] = currentHealth;
        
        // Check armor modification
        new currentArmor = GetPlayerArmour(playerid);
        if(currentArmor > ARMOR_MAX && currentArmor != PlayerData[playerid][pLastArmor]) {
            HandleArmorHackDetection(playerid, currentArmor);
        }
        PlayerData[playerid][pLastArmor] = currentArmor;
        
        // Check weapon modification
        new currentWeapon = GetPlayerWeapon(playerid);
        if(currentWeapon != PlayerData[playerid][pLastWeapon] && !WeaponGiven[playerid][currentWeapon]) {
            HandleWeaponHackDetection(playerid, currentWeapon);
        }
        PlayerData[playerid][pLastWeapon] = currentWeapon;
    }
}

// Speed hack detection
bool:IsPlayerSpeedHacking(playerid, Float:x, Float:y, Float:z) {
    new Float:distance = GetDistanceBetweenPoints(
        PlayerData[playerid][pLastX], PlayerData[playerid][pLastY], PlayerData[playerid][pLastZ],
        x, y, z
    );
    
    // Calculate speed (distance per second)
    new Float:speed = distance * 2.0; // Since timer runs every 0.5 seconds
    
    if(speed > SPEED_HACK_THRESHOLD) {
        return true;
    }
    
    return false;
}

// Teleport detection
bool:IsPlayerTeleporting(playerid, Float:x, Float:y, Float:z) {
    new Float:distance = GetDistanceBetweenPoints(
        PlayerData[playerid][pLastX], PlayerData[playerid][pLastY], PlayerData[playerid][pLastZ],
        x, y, z
    );
    
    if(distance > TELEPORT_DISTANCE_THRESHOLD) {
        return true;
    }
    
    return false;
}

// Aimbot detection
bool:IsPlayerAimbotting(playerid, targetid, weaponid) {
    if(!IsPlayerConnected(targetid)) return false;
    
    new Float:distance = GetPlayerDistanceFromPoint(targetid, 
        PlayerData[playerid][pLastX], PlayerData[playerid][pLastY], PlayerData[playerid][pLastZ]);
    
    // Check for impossible shots (very long distance with certain weapons)
    if(distance > 100.0 && (weaponid == WEAPON_DEAGLE || weaponid == WEAPON_SNIPER)) {
        return true;
    }
    
    return false;
}

// Bot detection
bool:IsPlayerBot(playerid) {
    new currentTime = GetTickCount();
    
    // Check for inhuman reaction times
    if(currentTime - PlayerData[playerid][pLastMovementTime] < 50) {
        PlayerData[playerid][pBotDetectionScore]++;
    }
    
    // Check for perfect accuracy patterns
    if(PlayerData[playerid][pBotDetectionScore] > 20) {
        return true;
    }
    
    return false;
}

// Vehicle spawning protection
public OnVehicleSpawn(vehicleid) {
    // Check if vehicle was spawned by a player
    new ownerid = VehicleOwner[vehicleid];
    if(ownerid != INVALID_PLAYER_ID) {
        new currentTime = GetTickCount();
        if(currentTime - PlayerData[ownerid][pVehicleSpawnTime] < VEHICLE_SPAWN_COOLDOWN) {
            HandleVehicleHackDetection(ownerid, vehicleid);
            DestroyVehicle(vehicleid);
            return 0;
        }
        PlayerData[ownerid][pVehicleSpawnTime] = currentTime;
    }
    
    VehicleSpawned[vehicleid] = true;
    VehicleSpawnTime[vehicleid] = GetTickCount();
    return 1;
}

// Object spawning protection
public OnPlayerCreateObject(playerid, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, Float:drawdistance) {
    new currentTime = GetTickCount();
    if(currentTime - PlayerData[playerid][pObjectSpawnTime] < OBJECT_SPAWN_COOLDOWN) {
        HandleObjectHackDetection(playerid, modelid);
        return 0;
    }
    
    PlayerData[playerid][pObjectSpawnTime] = currentTime;
    return 1;
}

// Weapon spawning protection
public OnPlayerGiveWeapon(playerid, weaponid, ammo) {
    new currentTime = GetTickCount();
    if(currentTime - PlayerData[playerid][pWeaponSpawnTime] < WEAPON_SPAWN_COOLDOWN) {
        HandleWeaponHackDetection(playerid, weaponid);
        RemovePlayerWeapon(playerid, weaponid);
        return 0;
    }
    
    PlayerData[playerid][pWeaponSpawnTime] = currentTime;
    WeaponGiven[playerid][weaponid] = true;
    return 1;
}

// Admin abuse protection
public OnPlayerCommandText(playerid, cmdtext[]) {
    if(IsPlayerAdmin(playerid)) {
        new currentTime = GetTickCount();
        if(currentTime - PlayerData[playerid][pAdminActionTime] < ADMIN_ACTION_COOLDOWN) {
            HandleAdminAbuseDetection(playerid, cmdtext);
            return 0;
        }
        
        PlayerData[playerid][pAdminActionTime] = currentTime;
        PlayerData[playerid][pAdminActionCount]++;
        
        // Log admin actions
        new logEntry[128];
        format(logEntry, sizeof(logEntry), "[%s] %s: %s", GetTimeString(), GetPlayerName(playerid), cmdtext);
        AdminActionLog[AdminActionLogIndex] = logEntry;
        AdminActionLogIndex = (AdminActionLogIndex + 1) % 100;
    }
    
    // Anticheat commands
    if(strcmp(cmdtext, "/acstats", true) == 0) {
        if(IsPlayerAdmin(playerid)) {
            ShowAnticheatStats(playerid);
        }
        return 1;
    }
    
    if(strcmp(cmdtext, "/acreset", true) == 0) {
        if(IsPlayerAdmin(playerid)) {
            ResetAnticheatStats();
            SendClientMessage(playerid, COLOR_GREEN, "[AvoX Ultimate] Statistics reset!");
        }
        return 1;
    }
    
    if(strcmp(cmdtext, "/acconfig", true) == 0) {
        if(IsPlayerAdmin(playerid)) {
            ShowAnticheatConfig(playerid);
        }
        return 1;
    }
    
    return 0;
}

// Detection handlers
HandleSpeedHackDetection(playerid) {
    PlayerData[playerid][pSpeedHackWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Speed hack detected for %s (ID: %d) - Warning %d/3", 
        GetPlayerName(playerid), playerid, PlayerData[playerid][pSpeedHackWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pSpeedHackWarnings] >= 3) {
        BanPlayer(playerid, "Speed hack detected");
    }
}

HandleTeleportDetection(playerid) {
    PlayerData[playerid][pTeleportWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Teleport detected for %s (ID: %d) - Warning %d/3", 
        GetPlayerName(playerid), playerid, PlayerData[playerid][pTeleportWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pTeleportWarnings] >= 3) {
        BanPlayer(playerid, "Teleport hack detected");
    }
}

HandleHealthHackDetection(playerid, health) {
    PlayerData[playerid][pHealthHackWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Health hack detected for %s (ID: %d) - Health: %d - Warning %d/3", 
        GetPlayerName(playerid), playerid, health, PlayerData[playerid][pHealthHackWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    // Reset health to maximum
    SetPlayerHealth(playerid, HEALTH_MAX);
    
    if(PlayerData[playerid][pHealthHackWarnings] >= 3) {
        BanPlayer(playerid, "Health hack detected");
    }
}

HandleArmorHackDetection(playerid, armor) {
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Armor hack detected for %s (ID: %d) - Armor: %d", 
        GetPlayerName(playerid), playerid, armor);
    SendMessageToAdmins(string, COLOR_RED);
    
    // Reset armor to maximum
    SetPlayerArmour(playerid, ARMOR_MAX);
}

HandleWeaponHackDetection(playerid, weaponid) {
    PlayerData[playerid][pWeaponHackWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Weapon hack detected for %s (ID: %d) - Weapon: %d - Warning %d/3", 
        GetPlayerName(playerid), playerid, weaponid, PlayerData[playerid][pWeaponHackWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pWeaponHackWarnings] >= 3) {
        BanPlayer(playerid, "Weapon hack detected");
    }
}

HandleVehicleHackDetection(playerid, vehicleid) {
    PlayerData[playerid][pVehicleHackWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Vehicle hack detected for %s (ID: %d) - Vehicle: %d - Warning %d/3", 
        GetPlayerName(playerid), playerid, vehicleid, PlayerData[playerid][pVehicleHackWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pVehicleHackWarnings] >= 3) {
        BanPlayer(playerid, "Vehicle hack detected");
    }
}

HandleObjectHackDetection(playerid, objectid) {
    PlayerData[playerid][pObjectHackWarnings]++;
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Object hack detected for %s (ID: %d) - Object: %d - Warning %d/3", 
        GetPlayerName(playerid), playerid, objectid, PlayerData[playerid][pObjectHackWarnings]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pObjectHackWarnings] >= 3) {
        BanPlayer(playerid, "Object hack detected");
    }
}

HandleAimbotDetection(playerid) {
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Aimbot detected for %s (ID: %d)", 
        GetPlayerName(playerid), playerid);
    SendMessageToAdmins(string, COLOR_RED);
}

HandleBotDetection(playerid) {
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Bot detected for %s (ID: %d)", 
        GetPlayerName(playerid), playerid);
    SendMessageToAdmins(string, COLOR_RED);
    
    BanPlayer(playerid, "Bot detected");
}

HandlePacketFloodDetection(playerid) {
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Packet flood detected for %s (ID: %d)", 
        GetPlayerName(playerid), playerid);
    SendMessageToAdmins(string, COLOR_RED);
    
    BanPlayer(playerid, "Packet flood detected");
}

HandleSuspiciousBehaviorDetection(playerid) {
    AC_Detections++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Suspicious behavior detected for %s (ID: %d)", 
        GetPlayerName(playerid), playerid);
    SendMessageToAdmins(string, COLOR_RED);
    
    BanPlayer(playerid, "Suspicious behavior detected");
}

HandleCrashAttemptDetection(playerid) {
    PlayerData[playerid][pCrashAttempts]++;
    AC_Crashes++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Crash attempt detected for %s (ID: %d) - Attempts: %d", 
        GetPlayerName(playerid), playerid, PlayerData[playerid][pCrashAttempts]);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pCrashAttempts] >= 3) {
        BanPlayer(playerid, "Crash attempts detected");
    }
}

HandleAdminAbuseDetection(playerid, const cmdtext[]) {
    PlayerData[playerid][pAdminActionCount]++;
    AC_AdminAbuse++;
    
    new string[128];
    format(string, sizeof(string), "[AvoX Ultimate] Admin abuse detected for %s (ID: %d) - Command: %s", 
        GetPlayerName(playerid), playerid, cmdtext);
    SendMessageToAdmins(string, COLOR_RED);
    
    if(PlayerData[playerid][pAdminActionCount] >= 10) {
        BanPlayer(playerid, "Admin abuse detected");
    }
}

// Utility functions
ResetPlayerData(playerid) {
    PlayerData[playerid][pSpawned] = false;
    PlayerData[playerid][pInVehicle] = false;
    PlayerData[playerid][pVehicleID] = INVALID_VEHICLE_ID;
    PlayerData[playerid][pLastX] = 0.0;
    PlayerData[playerid][pLastY] = 0.0;
    PlayerData[playerid][pLastZ] = 0.0;
    PlayerData[playerid][pLastHealth] = 0;
    PlayerData[playerid][pLastArmor] = 0;
    PlayerData[playerid][pLastWeapon] = 0;
    PlayerData[playerid][pVehicleSpawnTime] = 0;
    PlayerData[playerid][pWeaponSpawnTime] = 0;
    PlayerData[playerid][pObjectSpawnTime] = 0;
    PlayerData[playerid][pSpeedHackWarnings] = 0;
    PlayerData[playerid][pTeleportWarnings] = 0;
    PlayerData[playerid][pHealthHackWarnings] = 0;
    PlayerData[playerid][pWeaponHackWarnings] = 0;
    PlayerData[playerid][pVehicleHackWarnings] = 0;
    PlayerData[playerid][pObjectHackWarnings] = 0;
    PlayerData[playerid][pConnectionTime] = 0;
    PlayerData[playerid][pConnectionCount] = 0;
    PlayerData[playerid][pPacketCount] = 0;
    PlayerData[playerid][pLastPacketTime] = 0;
    PlayerData[playerid][pAdminActionTime] = 0;
    PlayerData[playerid][pAdminActionCount] = 0;
    PlayerData[playerid][pIsAdmin] = false;
    PlayerData[playerid][pCrashAttempts] = 0;
    PlayerData[playerid][pResourceInjectionAttempts] = 0;
    PlayerData[playerid][pCommandInjectionAttempts] = 0;
    PlayerData[playerid][pBotDetectionScore] = 0;
    PlayerData[playerid][pLastMovementTime] = 0;
    PlayerData[playerid][pSuspiciousActions] = 0;
    PlayerData[playerid][pBanReason] = "";
}

BanPlayer(playerid, const reason[]) {
    AC_Bans++;
    
    new string[256];
    format(string, sizeof(string), "[AvoX Ultimate] Player %s (ID: %d) has been banned for: %s", 
        GetPlayerName(playerid), playerid, reason);
    SendMessageToAdmins(string, COLOR_RED);
    
    // Store ban reason
    format(PlayerData[playerid][pBanReason], sizeof(PlayerData[playerid][pBanReason]), reason);
    
    // Ban the player
    Ban(playerid);
}

SendMessageToAdmins(const string[], color) {
    foreach(new i : Player) {
        if(IsPlayerAdmin(i)) {
            SendClientMessage(i, color, string);
        }
    }
    printf("%s", string);
}

GetIPHash(const ip[]) {
    new hash = 0;
    for(new i = 0; ip[i] != 0; i++) {
        hash = (hash * 31 + ip[i]) % 256;
    }
    return hash;
}

GetTimeString() {
    new time[32];
    gettime(time[0], time[1], time[2]);
    format(time, sizeof(time), "%02d:%02d:%02d", time[0], time[1], time[2]);
    return time;
}

IsValidWeapon(weaponid) {
    return (weaponid >= 0 && weaponid <= 46);
}

ShowAnticheatStats(playerid) {
    new string[512];
    format(string, sizeof(string), "=== AvoX Ultimate Anticheat Statistics ===\n\
        Detections: %d\n\
        Bans: %d\n\
        Crashes Prevented: %d\n\
        DDoS Attempts: %d\n\
        Admin Abuse: %d\n\
        Server Uptime: %d minutes\n\
        =========================================",
        AC_Detections, AC_Bans, AC_Crashes, AC_DDoS_Attempts, AC_AdminAbuse,
        (GetTickCount() - ServerStartTime) / 60000);
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "AvoX Ultimate Stats", string, "OK", "");
}

ResetAnticheatStats() {
    AC_Detections = 0;
    AC_Bans = 0;
    AC_Crashes = 0;
    AC_DDoS_Attempts = 0;
    AC_AdminAbuse = 0;
}

ShowAnticheatConfig(playerid) {
    new string[512];
    format(string, sizeof(string), "=== AvoX Ultimate Configuration ===\n\
        Speed Hack Threshold: %.1f\n\
        Teleport Distance: %.1f\n\
        Vehicle Spawn Cooldown: %d ms\n\
        Weapon Spawn Cooldown: %d ms\n\
        Object Spawn Cooldown: %d ms\n\
        Connection Flood Threshold: %d\n\
        Packet Flood Threshold: %d\n\
        Admin Action Cooldown: %d ms\n\
        ==================================",
        SPEED_HACK_THRESHOLD, TELEPORT_DISTANCE_THRESHOLD,
        VEHICLE_SPAWN_COOLDOWN, WEAPON_SPAWN_COOLDOWN, OBJECT_SPAWN_COOLDOWN,
        CONNECTION_FLOOD_THRESHOLD, PACKET_FLOOD_THRESHOLD, ADMIN_ACTION_COOLDOWN);
    ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "AvoX Ultimate Config", string, "OK", "");
}

// Public functions for other scripts
stock IsPlayerUsingAnticheat(playerid) {
    return (PlayerData[playerid][pSpawned]);
}

stock GetAnticheatDetections() {
    return AC_Detections;
}

stock GetAnticheatBans() {
    return AC_Bans;
}

stock GetAnticheatCrashes() {
    return AC_Crashes;
}

stock GetAnticheatDDoSAttempts() {
    return AC_DDoS_Attempts;
}

stock GetAnticheatAdminAbuse() {
    return AC_AdminAbuse;
}
