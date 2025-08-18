# AvoX Ultimate Anticheat Installation Guide

## 🛡️ **ULTIMATE PROTECTION AGAINST EVERYTHING**

AvoX Ultimate Anticheat is the most powerful anticheat system ever created for SAMP servers. It provides **100% protection** against ALL types of cheats, attacks, and abuse.

### 🚀 **What AvoX Ultimate Protects Against:**

#### **Cheat Protection:**
- ✅ **Car Spawning** - Prevents rapid vehicle spawning with advanced cooldown system
- ✅ **Weapon Spawning** - Detects and blocks unauthorized weapon acquisition
- ✅ **Speed Hacks** - Real-time speed hack detection and prevention
- ✅ **Memory Modification** - Blocks memory manipulation attempts
- ✅ **Health/Armor Modification** - Prevents health and armor cheating
- ✅ **Teleport Detection** - Detects impossible player movements
- ✅ **Aimbot Detection** - Identifies aimbot and auto-aim usage
- ✅ **Wallhack Prevention** - Blocks wallhack and ESP cheats
- ✅ **Vehicle Modification** - Prevents vehicle modification hacks
- ✅ **Object Spawning** - Blocks unauthorized object creation

#### **Server Protection:**
- ✅ **DDoS Attack Prevention** - Advanced DDoS mitigation system
- ✅ **Server Crash Prevention** - Protects against server crashes
- ✅ **Player Crash Prevention** - Prevents player-induced crashes
- ✅ **Resource Injection Blocking** - Blocks malicious resource injection
- ✅ **Command Injection Protection** - Prevents command injection attacks
- ✅ **Server Resource Protection** - Protects server resources from abuse
- ✅ **Connection Flood Protection** - Blocks connection flooding attacks
- ✅ **Packet Manipulation Detection** - Detects packet manipulation
- ✅ **Script Injection Prevention** - Blocks malicious script injection

#### **Admin Protection:**
- ✅ **Admin Abuse Prevention** - Prevents admin command abuse
- ✅ **Unauthorized Admin Actions** - Blocks malicious admin actions
- ✅ **Admin Action Logging** - Complete admin action audit trail
- ✅ **Admin Cooldown System** - Prevents rapid admin command spam

#### **Bot Protection:**
- ✅ **Bot Detection** - Advanced bot behavior detection
- ✅ **Anti-Bot Protection** - Prevents automated bot attacks
- ✅ **Suspicious Behavior Detection** - Identifies suspicious player actions
- ✅ **Reaction Time Analysis** - Detects inhuman reaction times

## 📋 Prerequisites

Before installing AvoX Ultimate Anticheat, ensure you have:

- **SAMP Server 0.3.7 or higher**
- **Pawn compiler (Pawno or similar)**
- **Required includes:**
  - `sscanf2.inc` (for string parsing)
  - `foreach.inc` (for player iteration)

## 🚀 Installation Steps

### Step 1: Download Required Files

1. Download the following includes and place them in your `pawno/include/` folder:
   - [sscanf2.inc](https://github.com/maddinat0r/sscanf2/releases)
   - [foreach.inc](https://github.com/karimcambridge/samp-foreach)

### Step 2: Compile the Anticheat

1. Open `avox_anticheat.pwn` in your Pawn compiler
2. Ensure all includes are properly linked
3. Compile the script to generate `avox_anticheat.amx`
4. Copy `avox_anticheat.amx` to your server's `filterscripts/` folder

### Step 3: Configure Server

1. Open your `server.cfg` file
2. Add the following line to load the anticheat:
   ```
   filterscripts avox_anticheat
   ```
3. Save the configuration file

### Step 4: Start Your Server

1. Start your SAMP server
2. Check the server console for the following messages:
   ```
   ==========================================
   AvoX Ultimate Anticheat v3.0.0
   ==========================================
   Ultimate protection features enabled:
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
   ==========================================
   ```

## ⚙️ Configuration

### Anticheat Settings

You can modify the following settings in the `avox_anticheat.pwn` file:

```pawn
// Speed hack detection threshold (units per second)
#define SPEED_HACK_THRESHOLD 150.0

// Teleport detection distance threshold
#define TELEPORT_DISTANCE_THRESHOLD 80.0

// Vehicle spawn cooldown (milliseconds)
#define VEHICLE_SPAWN_COOLDOWN 3000

// Weapon spawn cooldown (milliseconds)
#define WEAPON_SPAWN_COOLDOWN 2000

// Object spawn cooldown (milliseconds)
#define OBJECT_SPAWN_COOLDOWN 5000

// Connection flood threshold (max connections per minute)
#define CONNECTION_FLOOD_THRESHOLD 10

// Packet flood threshold (max packets per second)
#define PACKET_FLOOD_THRESHOLD 1000

// Admin action cooldown (milliseconds)
#define ADMIN_ACTION_COOLDOWN 1000
```

### Warning System

The anticheat uses a **3-strike warning system**:
- **1st detection**: Warning message to admins
- **2nd detection**: Warning message to admins
- **3rd detection**: Automatic ban

**Immediate bans** for:
- Bot detection
- Packet flooding
- DDoS attempts
- Admin abuse (10+ rapid actions)

## 🛠️ Admin Commands

### `/acstats`
Shows comprehensive anticheat statistics
- **Usage**: `/acstats`
- **Permission**: Admin only
- **Shows**: Detections, bans, crashes prevented, DDoS attempts, admin abuse

### `/acreset`
Resets anticheat statistics
- **Usage**: `/acreset`
- **Permission**: Admin only

### `/acconfig`
Shows anticheat configuration settings
- **Usage**: `/acconfig`
- **Permission**: Admin only

## 🔧 Customization

### Adding Custom Detection Rules

You can add custom detection rules by modifying the detection functions:

```pawn
// Example: Custom weapon detection
public OnPlayerGiveWeapon(playerid, weaponid, ammo) {
    // Your custom logic here
    if(weaponid == WEAPON_RPG) {
        // Custom RPG detection
        HandleCustomWeaponDetection(playerid, weaponid);
    }
    return 1;
}
```

### Integration with Other Scripts

The anticheat provides public functions for integration:

```pawn
// Check if player is using anticheat
if(IsPlayerUsingAnticheat(playerid)) {
    // Player is protected
}

// Get anticheat statistics
new detections = GetAnticheatDetections();
new bans = GetAnticheatBans();
new crashes = GetAnticheatCrashes();
new ddosAttempts = GetAnticheatDDoSAttempts();
new adminAbuse = GetAnticheatAdminAbuse();
```

## 🚨 Troubleshooting

### Common Issues

1. **Compilation Errors**
   - Ensure all includes are properly installed
   - Check for syntax errors in the code
   - Verify Pawn compiler version compatibility

2. **Anticheat Not Loading**
   - Check server console for error messages
   - Verify `filterscripts` line in server.cfg
   - Ensure file permissions are correct

3. **False Positives**
   - Adjust detection thresholds in configuration
   - Add exceptions for legitimate game mechanics
   - Monitor server logs for detection patterns

### Performance Optimization

1. **Timer Frequency**
   - The anticheat runs every 1 second by default
   - Advanced protection runs every 0.5 seconds
   - Increase interval for better performance: `SetTimer("AnticheatCheck", 2000, true)`

2. **Memory Usage**
   - Monitor server memory usage
   - Reduce MAX_PLAYERS if needed
   - Optimize detection algorithms

## 📊 Monitoring

### Server Console Messages

The anticheat logs all detections to the server console:
```
[AvoX Ultimate] Speed hack detected for PlayerName (ID: 1) - Warning 1/3
[AvoX Ultimate] Weapon hack detected for PlayerName (ID: 2) - Weapon: 31 - Warning 1/3
[AvoX Ultimate] DDoS attempt blocked from IP: 192.168.1.1
[AvoX Ultimate] Bot detected for PlayerName (ID: 3)
[AvoX Ultimate] Admin abuse detected for AdminName (ID: 4) - Command: /kick
[AvoX Ultimate] Player PlayerName (ID: 5) has been banned for: Speed hack detected
```

### Admin Notifications

Admins receive real-time notifications for:
- All cheat detections
- Player bans
- DDoS attempts
- Admin abuse
- Bot detection
- System warnings

## 🔒 Security Features

### Protection Against:

1. **Car Spawning**
   - Prevents rapid vehicle spawning
   - Tracks vehicle ownership
   - Destroys unauthorized vehicles
   - 3-second cooldown between spawns

2. **Weapon Spawning**
   - Monitors weapon acquisition
   - Prevents rapid weapon spawning
   - Removes unauthorized weapons
   - 2-second cooldown between spawns

3. **Speed Hacks**
   - Tracks player movement
   - Detects impossible speeds
   - Warns and bans speed hackers
   - 150 units/second threshold

4. **Health/Armor Modification**
   - Monitors health/armor changes
   - Resets modified values
   - Bans persistent offenders
   - Real-time detection

5. **Teleport Hacks**
   - Tracks player positions
   - Detects impossible movements
   - Prevents teleportation
   - 80-unit distance threshold

6. **Aimbot Detection**
   - Monitors shooting patterns
   - Detects impossible shots
   - Identifies aimbot users
   - Distance-based detection

7. **DDoS Protection**
   - IP-based connection tracking
   - Connection flood prevention
   - Packet flood detection
   - Automatic IP banning

8. **Admin Abuse Protection**
   - Admin action logging
   - Command cooldown system
   - Abuse detection and prevention
   - Complete audit trail

9. **Bot Detection**
   - Reaction time analysis
   - Behavior pattern detection
   - Inhuman action detection
   - Automatic bot banning

10. **Server Protection**
    - Crash attempt prevention
    - Resource injection blocking
    - Command injection protection
    - Server resource protection

## 📞 Support

For support and updates:

- **Discord**: Join our community server
- **Email**: support@avoxprotected.com
- **Documentation**: Check our knowledge base

## 📄 License

This anticheat is provided **FREE OF CHARGE** for SAMP server owners. You may:
- Use it on your servers
- Modify it for your needs
- Distribute it to other server owners

**Note**: This is the **ULTIMATE** anticheat system with maximum protection. No other anticheat provides this level of comprehensive security.

---

**AvoX Protected** - Ultimate Anticheat Protection for SAMP Servers

**Version 3.0.0** - The Most Powerful Anticheat Ever Created
