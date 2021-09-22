The original script has been modified in which only general data is extracted from the operating system, in this version some data is collected more divided by layer, without losing the original style or need. (by VeLinux).

XaaS CIS.

Original Autor Templates:
> ├── examples
│   ├── commands_list1
│   ├── commands_list2
│   ├── example.html

> Aditional VeLinux Templates:

│   ├── template_oracle_app
│   ├── template_oracle_db
│   └── template_os

#### GIT CLONE:
```
>yum install git 

>git clone https://github.com/velinux/automaticRep

>cd automaticRep

>ls 
_config.yml  examples  executable  functions  LICENSE  README.md  sh  sysinfo.html  sysinfo.sh  vars
```

#### How to run command:
```  
sysinfo.sh -c cmd_list -o output.html
```
> -c cmd_list is the template to use (see template setup below) [required]

> -o output.html is the html output file (default: sysinfo.html) [optional] 

> run with -h option to display help menu [optional]

> example to oracle database extract report

>Into folder automaticRep

```  
sh sysinfo.sh -c examples/template_oracle_db -o /tmp/Sysinfo_$(hostname)_to_Migrate_db_Report.html
```

> example to oracle app extract report

```  
sh sysinfo.sh -c examples/template_oracle_app -o /tmp/Sysinfo_$(hostname)_to_Migrate_app_Report.html
```

> example to operative system  extract report

```  
sh sysinfo.sh -c examples/template_os -o /tmp/Sysinfo_$(hostname)_to_Migrate_os_Report.html
```

#### Setup command template:

##### Source bash functions 
```
source /$(pwd)/functions
```
##### Source vars

> Add to variables to run a shell && SQL Querys and print to report HTML

```
source /$(pwd)/vars/oracle.env
```

##### Create a heading

```bash
heading_start "Example Heading"
```

##### Create a sub heading with command output
Start with sub heading

```bash
sub_start "Example sub heading"
```
Now add the command to show
```bash
run_command "route -n"
```
> Surround commands with double quotes.

##### Complete and finish headings
Close sub heading
```bash
sub_end
```
Close heading
```bash
heading_end
```

End result would like something like this:
```bash
source /$(pwd)/functions

heading_start "Example Heading"

  sub_start "Example sub heading"

    run_command "route -n"

  sub_end

heading_end
```
> NB: indention is not required, just makes it look nicer

HTML output:
![Example Screenshot](https://i.imgur.com/cWozQTG.png)

You can also create nested sub headings 
```bash
source /$(pwd)/functions

heading_start "Example Heading"

  sub_start "Example sub heading"

    sub_start "Nested sub heading 1"

    run_command "route -n"

    sub_end
    
    sub_start "Nested sub heading 2"

    run_command "ifconfig -a"

    sub_end

  sub_end

heading_end
```
HTML output:
![Example Screenshot](https://i.imgur.com/qMEIGtp.png)

HTML DB output:
![Example DB Screenshot](https://i.imgur.com/fNJtJIQ.png)

HTML OS output:
![Example OS Screenshot](https://i.imgur.com/kjKMxDf.png)

#### This script also supports more complicated commands (see below)

###### Advanced Example 1:
```bash
sub_start "Advanced Example 1"
  run_command "[ -f /etc/hosts ] && echo 'File Exist' && grep 'local' /etc/hosts | wc -l"
sub_end
```
###### Advanced Example 2:
```bash
sub_start "Advanced example 2"
  ifconfig | grep 'eth\|lo' | cut -c1-4 >interfaces.tmp
  while read line
  do
    run_command "ethtool $line"
  done <interfaces.tmp
  rm -f interfaces.tmp
sub_end
```
###### Loop Example:
```bash
sub_start "Loop Example"
  for i in {1..5}
  do
    run_command echo "$i"
  done
sub_end
```
###### Note by Second Rebuilder code:
```bash
I would like us to collaborate and this code improves much more, the purpose can help us all. 
```
