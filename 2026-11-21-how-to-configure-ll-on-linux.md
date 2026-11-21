In Debian 13 (Trixie), `ll` is usually **a shell alias for `ls -l`**, not a separate Linux command. You don't need to install additional software.

You can configure it easily.

## 1\. Check whether `ll` already exists

Run\:

```
type ll
```



If you see\:

```
bash: type: ll: not found
```



It means the alias is not configured.

## 2\. Configure `ll` permanently

If you are using Bash (the default interactive shell for most Debian users), open your configuration file\:

```
nano ~/.bashrc
```



Add the following line at the end\:

```
alias ll='ls -alF --color=auto'
```



Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`\).

Apply the configuration immediately\:

```
source ~/.bashrc
```



Now try\:

```
ll
```



You should see a detailed directory listing, including hidden files, file permissions, owners, sizes, and modification times.

## 3\. Other useful aliases

You can also add these to `~/.bashrc`\:

```
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
```



| Command | Function |
|--------|--------|
| `ls` | List files and directories |
| `ll` | Detailed listing, including hidden files |
| `la` | List files, including hidden files |
| `l` | Compact multi-column listing |
| `ls -lh` | Detailed listing with human-readable sizes |
| `ls -lt` | Sort by modification time |

## 4\. Configure `ll` for the root user (optional)

On your Debian server, if you sometimes switch to root using `su -`, remember that root has a separate `.bashrc`\.

Configure it with\:

```
sudo nano /root/.bashrc
```



Add\:

```
alias ll='ls -alhF --color=auto'
```



Here, `-h` makes file sizes easier to read, such as `4.0K`, `128M`, and `2.1G`\.

**My recommendation\:** Use `ls -alhF --color=auto` for `ll` on your Debian 13 server. It provides detailed, readable listings without installing anything.

You can verify your configuration using\:

```
type ll
ll /var/log
```



This approach follows Debian's standard Bash alias configuration. [debian.org](https://www.debian.org/doc/manuals/debian-reference/debian-reference.en.pdf)[wiki.debian.org](https://wiki.debian.org/BashProfileReset)
