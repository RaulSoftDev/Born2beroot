<div align="center">
  <img width="175" src="https://img.shields.io/badge/Grade-100%25-00dd13?style=for-the-badge&logo=42"/>
</div>

<div align="center">
  <h1 align="center">Born2beroot</h1>
</div>

<p direction="auto">
  Born2beroot is a 42 Madrid Common Core project in which you will have to create your first virtual machine following specific instructions. At the end of this project you will be able to configure your operating system with strict rules.
</p>

## About the project
<p direction="auto">
  For this project you must set up a virtual machine on <code>VirtualBox</code> or <code>UTM</code> running either <code>Debian</code> or <code>Rocky Linux</code> server.
</p>
<h3>Mandatory parts</h3>
<ul>
  <li>For the operating system you must choose between <code>Debian</code> or <code>Rocky Linux</code>.</li>
  <li>You must create two LVM encrypted partitions.</li>
  <li>The server will run the <code>SSH</code> service on <code>4242</code> port only. You can't connect through this service as <code>root</code>.</li>
  <li>The server must have configured <code>UFW</code> firewall with only <code>4242</code> port open.</li>
  <li>You have to code a <code>bash</code> script named <code>monitoring.sh</code> which will show system information every 10 minutes from the server launch.</li>
</ul>
<h3>Bash Script Information</h3>
<ul>
  <li>Operating system architecture and kernel version.</li>
  <li>Number of physical cores.</li>
  <li>Number of virtual cores.</li>
  <li>Available RAM memory and percentage of use.</li>
  <li>Available storage memory and percentage of use.</li>
  <li>Percentage of current use of the cores.</li>
  <li>Last reboot date and time.</li>
  <li>Check if <code>LVM</code> is running.</li>
  <li>Number of active connections.</li>
  <li>Number of current logged in users.</li>
  <li>IPv4 and MAC server addresses.</li>
  <li>Number of <code>sudo</code> commands used on the server.</li>
</ul>

## Compilation

<h3>Build project</h3>
<ol>
<li>
<p dir="auto">Clone the repository:</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto"><pre><samp>git clone https://github.com/RaulSoftDev/Born2beroot.git
<span class="pl-c1">cd</span> Born2beroot/</samp></pre>
</div>
</li>
<li>
<p dir="auto">Give execution privileges to the script:</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto"><pre><samp>chmod 755 monitoring.sh</samp></pre>
</div>
</li>
<li>
<p dir="auto">Execute the script:</p>
<div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto"><pre><samp>./monitoring.sh</samp></pre>
</div>
</li>
</ol>
