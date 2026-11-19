To connect to your local MySQL server running on port 6033, run mysql -h 127.0.0.1 -P 6033 -u root -p in your terminal or command prompt. [1] (/goto?url=CAESlgEBxCJF1-fOWKzsOm-O4VEHtQeYEEAKwcRtwVyDe-R3tewLk9mAGaRspvuAmonB9WLn4arUd3h1UsQV7mfK6omhsVDGYvap_FaSH4oz-hUiIaaMaWZ7ufcYXz4D6p2KNQhpVuR93oo7v70GQ1N1-zlZ4CtMh2cvgap99_57YVIUqJsgIfK_TBK7tsNAnIG9PyPxlHvc2yY), [2] (/goto?url=CAESmQEBxCJF12u4us8C3_4hsh-LDhqYFUSBa96zv42F4-h4X4aLl-0fo5UdHUFgTsllJz-ZqhsajACIfwVQExBK_8_HuBRKGYorJJon3CFNinQqu8NFDpH1Rer-E-yNovZIcF7ijVRPSOxYyghUiB7JOzvBKrghELbUuV8qPNWGz9DHsN-LmkgidCY8cMEH8SlMQijVAwQFF02f-IQ)
Using 127.0.0.1 instead of localhost forces a TCP/IP connection, which ensures the client actually uses the -P 6033 port flag rather than defaulting to a local Unix socket file. [1] (/goto?url=CAESdAHEIkXXCIWSSsyDWlK8WNObV9SkW771D3UE3_SqCy9jwtG3HlnclbV-purBN2Ry6ooed_XENxkGxAhO-bOjghK8w1FCXYLsEYPmxMmVMO2AA7wrHQ2qgCUEnCoAv7Dv1qgc_xH36zz4wPCj3SfbeNCNoP0-)

Command Breakdown

• Host (-h 127.0.0.1). Targets your local machine over TCP/IP so the custom port is respected. On macOS or Linux, typing -h localhost ignores the -P flag and connects to your primary server via its socket file instead.
• Port (-P 6033). Tells the client to connect to port 6033 instead of the default 3306. Make sure to use an uppercase -P.
• User (-u root). Specifies your MySQL username. Replace root if this second server uses a different user account.
• Password (-p). Prompts you to type your password securely after pressing Enter. Note that this must be a lowercase -p. [1] (/goto?url=CAESbgHEIkXXm-IdpcP0KfGLXxFv8tL_DZQ1E1KcNhwaAPKpBzWkorLPvF4YsMiekrxHcCYUTBkMuZOOuQJ2rsRzxiqLm7uy50ci35wdvc08_Wpm2Olc6uGFLPJkNHMcVBzFpXZWPEjFnPFfUKv5PT2v), [2] (/goto?url=CAESoAEBxCJF17uISeargPwKVz_lgDHc6dUu1mkoAMierM48yo1BGYlDw5AtxjHLapMm8otyWQLCVuDz69ybQMW9w1Kbwk84iEochkHkK3yiwSdd9a6Y6CemhFobfUeVxF0ZRTjgV5E0znTAtDcRaRB9ABABYZ0wdUpwxDXTxaC_8O0XTSz_UVlgWtQqFfbwsu7qmcua2j6SvJ_nfvXR_Cpmr-Ia), [3] (/goto?url=CAESmQEBxCJF12u4us8C3_4hsh-LDhqYFUSBa96zv42F4-h4X4aLl-0fo5UdHUFgTsllJz-ZqhsajACIfwVQExBK_8_HuBRKGYorJJon3CFNinQqu8NFDpH1Rer-E-yNovZIcF7ijVRPSOxYyghUiB7JOzvBKrghELbUuV8qPNWGz9DHsN-LmkgidCY8cMEH8SlMQijVAwQFF02f-IQ), [4] (/goto?url=CAESdAHEIkXXCIWSSsyDWlK8WNObV9SkW771D3UE3_SqCy9jwtG3HlnclbV-purBN2Ry6ooed_XENxkGxAhO-bOjghK8w1FCXYLsEYPmxMmVMO2AA7wrHQ2qgCUEnCoAv7Dv1qgc_xH36zz4wPCj3SfbeNCNoP0-)

Quick Troubleshooting

• Connection refused error. Verify that the second MySQL instance is actively running and bound to port 6033.
• Command not found error. If mysql is not recognized in your terminal, navigate to the bin folder inside your MySQL installation directory or add it to your system's PATH.
• Verify your connection. Once inside the mysql> prompt, run SELECT @@port; to confirm you are connected to the 6033 instance. [1] (/goto?url=CAESbgHEIkXXQm65VKVWtrg2AS5RAMwaNk7Vw4f-w5ZI1WL-WyAYaILF6fw7f_KBmr60rKKRR_0tr5h6xLFmlCDfPfA4KI5j_r-lEDGwrMltYqfvPh7Vz-TP8rsuRWHXNztkGK8lKPqEpdIPq6Nfg_GF), [2] (/goto?url=CAESkQEBxCJF19ayOfIbJpWN-br7EBRZTYPUFGlQkB0j3xkdSwgo9zAW8p9OaQ4ObPv4nJdPb5p-C5O6gpz6gXYIdBQqp8QT37xyALdtzz12NdV34mYWJ3UZh9qtzlvkq8HdYIGb05Z4v23CNgSOfeMsD4BaocZi4z6Qjis1dcuWclo9-_bYEfvRGz34bH-VKK0Zyyig), [3] (/goto?url=CAESaAHEIkXXuTCw-mP1A1Z7fK3fj3WenmpEWDaaPjLf0cK9b3yZI7v95DhN1Vsoj2gj2qKVQfXgMBEaxkODMwN_TvzFBx8yMpcLs83laK5HbCn8Vjt0XtlN6Y1J6TOGH3Ie87v5nelyNFyO)
If you run into a connection error, let me know:
• Your operating system (Windows, macOS, or Linux)
• How the second server is running (e.g., Docker, Homebrew, MAMP/XAMPP, or a local service)
I can help you troubleshoot the exact configuration or socket path.

---

To fix this error, add --ssl-mode=DISABLED to your command:
powershell
mysql -h 127.0.0.1 -P 6033 -u root -p --ssl-mode=DISABLED
Use code with caution.

Why This Happens

• SSL handshake mismatch. Modern MySQL command-line clients automatically require or prefer an encrypted SSL/TLS connection by default.
• Server configuration conflict. Your second MySQL instance on port 6033 (commonly an older MySQL 5.7/5.6 version, a Docker container, or a ProxySQL instance) either does not have SSL certificates configured or uses an older TLS protocol that your newer Windows client rejects.

Alternative If That Flag Isn't Recognized

• For older MySQL CLI versions. If your terminal says unknown variable 'ssl-mode=DISABLED', use the legacy --skip-ssl flag instead.
powershell
mysql -h 127.0.0.1 -P 6033 -u root -p --skip-ssl
Use code with caution.

Permanent Fix (Optional)

If you connect to this server frequently and don't want to type the flag every time:
• Update your my.ini file. Open your MySQL client configuration file (typically found in C:\ProgramData\MySQL\MySQL Server X.X\my.ini or %APPDATA%\MySQL\.my.cnf) and add ssl-mode=DISABLED under the [client] section.
If you want to permanently enable SSL on that second server instead of disabling it on the client, let me know:
• What MySQL version is running on port 6033 (e.g., MySQL 5.7, MySQL 8.0, MariaDB, or ProxySQL)
• Whether it is running in Docker or as a Windows Service
I can guide you through generating the matching SSL certificates.


---

The --ssl-mode=DISABLED flag actually resolved the SSL error, which revealed a second issue: ERROR 2059: Authentication plugin 'caching_sha2_password' cannot be loaded.
This happens because the mysql.exe command you are running in PowerShell belongs to an older MySQL installation (such as MySQL 5.7) listed first in your Windows PATH, and it does not have the modern caching_sha2_password plugin required to log into your MySQL 8.4 server.

Solution 1: Run the MySQL 8.4 Client Directly (Fastest)

Bypass the older client in your PATH by calling the full file path of your MySQL 8.4 executable:
powershell
& "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" -h 127.0.0.1 -P 6033 -u root -p --ssl-mode=DISABLED
Use code with caution.
(Note: If you installed MySQL 8.4 in a custom folder, replace the path inside the quotes with your actual bin\mysql.exe location.)

Solution 2: Fix Your Windows Environment PATH (Permanent)

To make the normal mysql command use your 8.4 client automatically:
1. Open the Windows Start menu, type Edit the system environment variables, and press Enter.
2. Click the Environment Variables... button near the bottom right.
3. Under System variables, select Path and click Edit....
4. Find the entry for your older MySQL bin folder (e.g., MySQL Server 5.7\bin) and move C:\Program Files\MySQL\MySQL Server 8.4\bin above it using the Move Up button (or add it if it isn't listed).
5. Click OK on all windows, then restart PowerShell for the change to take effect.

Why --ssl-mode=DISABLED Is Still Needed

• Non-SSL password exchange. In MySQL 8.4, caching_sha2_password normally requires an encrypted SSL connection to send your password safely.
• RSA key fallback. Because your port 6033 server has an SSL configuration issue, adding --get-server-public-key alongside --ssl-mode=DISABLED may also be required if it throws a public key retrieval error next:
powershell
& "C:\Program Files\MySQL\MySQL Server 8.4\bin\mysql.exe" -h 127.0.0.1 -P 6033 -u root -p --ssl-mode=DISABLED --get-server-public-key
Use code with caution.
If you aren't sure where your MySQL 8.4 bin folder is located or still get an error after running the full path, paste the output of where.exe mysql in PowerShell and I can give you the exact command.
