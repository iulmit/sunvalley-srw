#define MyAppName "System Readiness for Workstations"
#define MyAppVersion "0.0.7.0"
#define MyAppURL "https://github.com/mrkenhoo/sunvalley-srw"
#define MyAppExeName "sunvalley-srw.exe"
#define MyUsername "mrkenhoo"
#define VersionInfoDescription "System Readiness for Workstations is an automated privacy-focused configuration tool which debloats and tweaks any compatible Windows version and edition to improve it's performance and reduce the user's footprint as much as possible."

[Setup]
SignTool=default $f
SignedUninstaller=yes
AppId={{28B11907-066D-4911-BA15-E70234360C28}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={autopf}\{#MyUsername}\sunvalley-srw
DefaultGroupName={#MyUsername}\sunvalley-srw
AllowNoIcons=yes
LicenseFile=C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\LICENSE
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\inno_setup
OutputBaseFilename=sunvalley-srw-setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
VersionInfoCompany=Ken Hoo
VersionInfoCopyright=GPLv3
VersionInfoDescription={#VersionInfoDescription}
VersionInfoOriginalFileName=sunvalley-srw-setup.exe
VersionInfoProductName=System Readiness for Workstations
VersionInfoProductVersion={#MyAppVersion}
VersionInfoProductTextVersion={#MyAppVersion}
VersionInfoTextVersion={#MyAppVersion}
WizardResizable=no
WindowResizable=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\workstations\bin\Release\netcoreapp3.1\publish\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\workstations\bin\Release\netcoreapp3.1\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

