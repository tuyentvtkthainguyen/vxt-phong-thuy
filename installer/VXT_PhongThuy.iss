; Kịch bản Inno Setup 6 – VXT Phong Thủy
#define MyAppName "VXT Phong Thủy"
#ifndef MyAppVersion
  #define MyAppVersion "1.0.0"
#endif
#define MyAppPublisher "Vũ Xuân Tuyến"

[Setup]
AppId={{6F1B7A52-3C9E-4E2B-9D61-5A8C2F7E4B10}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={localappdata}\VXT PhongThuy
DefaultGroupName=VXT Phong Thuy
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\Output
OutputBaseFilename=VXT_PhongThuy_Setup_{#MyAppVersion}
SetupIconFile=..\app\icon.ico
UninstallDisplayIcon={app}\icon.ico
UninstallDisplayName={#MyAppName}
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Tạo biểu tượng trên Desktop"; GroupDescription: "Biểu tượng:"

[Files]
Source: "..\app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{group}\VXT Phong Thuy"; Filename: "{code:GetBrowser}"; Parameters: "{code:GetParams}"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"
Name: "{group}\Gỡ VXT Phong Thuy"; Filename: "{uninstallexe}"
Name: "{autodesktop}\VXT Phong Thuy"; Filename: "{code:GetBrowser}"; Parameters: "{code:GetParams}"; WorkingDir: "{app}"; IconFilename: "{app}\icon.ico"; Tasks: desktopicon

[Run]
Filename: "{code:GetBrowser}"; Parameters: "{code:GetParams}"; Description: "Mở VXT Phong Thủy"; Flags: nowait postinstall skipifsilent

[Code]
var Browser: string;

function FindBrowser(): string;
var c: array of string; i: Integer;
begin
  SetArrayLength(c, 6);
  c[0] := ExpandConstant('{commonpf32}\Microsoft\Edge\Application\msedge.exe');
  c[1] := ExpandConstant('{commonpf64}\Microsoft\Edge\Application\msedge.exe');
  c[2] := ExpandConstant('{localappdata}\Microsoft\Edge\Application\msedge.exe');
  c[3] := ExpandConstant('{commonpf64}\Google\Chrome\Application\chrome.exe');
  c[4] := ExpandConstant('{commonpf32}\Google\Chrome\Application\chrome.exe');
  c[5] := ExpandConstant('{localappdata}\Google\Chrome\Application\chrome.exe');
  Result := '';
  for i := 0 to 5 do
    if FileExists(c[i]) then begin Result := c[i]; Exit; end;
end;

function GetBrowser(Param: string): string;
begin
  if Browser = '' then Browser := FindBrowser();
  if Browser <> '' then Result := Browser
  else Result := ExpandConstant('{app}\index.html');
end;

function GetParams(Param: string): string;
var u: string;
begin
  if Browser = '' then Browser := FindBrowser();
  if Browser = '' then begin Result := ''; Exit; end;
  u := ExpandConstant('{app}\index.html');
  StringChangeEx(u, '\', '/', True);
  Result := '--app="file:///' + u + '" --window-size=1280,900';
end;
