#define MyAppName "System Readiness for Workstations"
#define MyAppVersion "0.0.3.1"
#define MyAppURL "https://github.com/gfelipe099/sunvalley-srw"
#define MyAppExeName "sunvalley-srw.exe"
#define MyUsername "gfelipe099"

[Setup]
AppId={{28B11907-066D-4911-BA15-E70234360C28}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}/releases
DefaultDirName={autopf}\Liam Powell\sunvalley-srw
DefaultGroupName=Liam Powell\sunvalley-srw
AllowNoIcons=yes
LicenseFile=C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\LICENSE
PrivilegesRequiredOverridesAllowed=dialog
OutputDir=C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\inno_setup
OutputBaseFilename=sunvalley-srw-setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\workstations\bin\Release\netcoreapp3.1\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\{#MyUsername}\Documents\GitHub\sunvalley-srw\workstations\bin\Release\netcoreapp3.1\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

