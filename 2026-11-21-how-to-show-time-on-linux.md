On **Debian 13 (Trixie)**, you can use the `date` and `timedatectl` commands to display the current system time.

## **1. Show current date and time**

```
date
```

Example output:

```
Sat Nov 21 10:30:45 CST 2026
```

To display time only:

```
date +"%H:%M:%S"
```

Example:

```
10:30:45
```

## **2. Show detailed system time information**

```
timedatectl
```

Example output:

```
               Local time: Sat 2026-11-21 10:30:45 CST
           Universal time: Sat 2026-11-21 02:30:45 UTC
                 RTC time: Sat 2026-11-21 02:30:44
                Time zone: Asia/Shanghai (CST, +0800)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

This shows your local time, UTC time, hardware clock, configured time zone, and synchronization status.

## **3. Check or change the time zone**

Check your current time zone:

```
timedatectl show -p Timezone
```

Since your Debian server is physically located in China, you may want to configure the `Asia/Shanghai` time zone:

```
sudo timedatectl set-timezone Asia/Shanghai
```

Verify:

```
date
timedatectl
```

## **4. Enable automatic time synchronization**

Check synchronization:

```
timedatectl status
```

Enable NTP synchronization:

```
sudo timedatectl set-ntp true
```

If this command fails, your server may need an NTP service such as `systemd-timesyncd` or `chrony`.

## **5. Other useful commands**

| Command           | Function                               |
| ----------------- | -------------------------------------- |
| `date`            | Show current date and time             |
| `date -u`         | Show UTC time                          |
| `date +"%F %T"`   | Show `YYYY-MM-DD HH:MM:SS`             |
| `date +%s`        | Show Unix timestamp                    |
| `timedatectl`     | Show system clock and time zone        |
| `hwclock --show`  | Show hardware clock (RTC)              |
| `watch -n 1 date` | Continuously display time every second |

**My recommendation:** For your Debian 13 server, use `date` for quick checks and `timedatectl` to verify that the time zone and automatic synchronization are configured correctly.
