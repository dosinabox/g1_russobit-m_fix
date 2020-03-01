###################################
##      Подключенные хидеры      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            Основное           ##
###################################

!define MOD_NAME "Gothic Russobit-M Fix"
!define MOD_VERSION "декабрь 2018"
!define MOD_DETAILED_VERSION "1.16.0.0"
!define MOD_AUTHOR "D36"
!define INSTALLER_NAME "GothicRussobitMFix_12.18_install"
!define UNINSTALLER_NAME "Gothic_RussobitM_Fix_Uninstall"

Name "${MOD_NAME}"
OutFile "${INSTALLER_NAME}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "CompanyName" "${MOD_AUTHOR}"
VIAddVersionKey "FileVersion" "${INSTALLER_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME}"
VIAddVersionKey "OriginalFilename" "${INSTALLER_NAME}.exe"
VIAddVersionKey "ProductName" "${MOD_NAME}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

Unicode true
SetCompressor lzma

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "Gothic_RussobitM_Fix.ico"
!define MUI_UNICON "Gothic_RussobitM_Fix.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME} - установка"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t${MOD_NAME}$\n$\t     (${MOD_VERSION})"
!define MUI_TEXT_WELCOME_INFO_TEXT "Целью данного мода является исправление багов и недоработок Готики, а также некоторые расширения возможностей игрока. \
$\n$\nМод предназначен для установки на русскую версию от Руссобит-М, требуется начало новой игры."

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "Программа установит ${MOD_NAME} в указанную папку. \
$\n$\nЧтобы установить модификацию в другую папку, нажмите кнопку  'Обзор ...'  и укажите ее. \
$\n$\n$\nНажмите кнопку  'Далее'  для продолжения."

!define MUI_TEXT_COMPONENTS_TITLE "Выбор компонентов для установки"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты ${MOD_NAME}, которые вы хотите установить.$\nНажмите кнопку \
'Установить' для продолжения." 
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для установки:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_FINISH_INFO_TITLE "$\t${MOD_NAME}$\n$\t      (${MOD_VERSION})"
!define MUI_TEXT_FINISH_INFO_TEXT "Установка завершена. Приятной игры! $\n$\nНажмите кнопку  'Готово'  для завершения."

UninstallCaption "${MOD_NAME} - удаление"
!define MUI_UNTEXT_WELCOME_INFO_TITLE "$\t${MOD_NAME}"
!define MUI_UNTEXT_WELCOME_INFO_TEXT "Все компоненты ${MOD_NAME} будут удалены из папки с игрой. \
$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\nНажмите кнопку  'Далее'  для продолжения."

!define MUI_UNTEXT_COMPONENTS_TITLE "Выбор компонентов для удаления"
!define MUI_UNTEXT_COMPONENTS_SUBTITLE " "

!define MUI_UNTEXT_FINISH_INFO_TITLE "$\t${MOD_NAME}"
!define MUI_UNTEXT_FINISH_INFO_TEXT "Все компоненты модификации удалены из папки с игрой. \
$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\n$\nНажмите кнопку  'Готово'  для завершения."

BrandingText " "

###################################
##     Страницы  инсталлятора    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##    Страницы  деинсталлятора   ##
###################################

!insertmacro MUI_UNPAGE_WELCOME
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты модификации, которые вы хотите удалить.$\nНажмите кнопку  \
'Удалить'  для продолжения."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для удаления:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##            Макросы            ##
###################################

!macro GMF_File_Rename FILENAME_1 FILENAME_2
	File "${FILENAME_1}"
	IfFileExists "${FILENAME_2}" "" +2
	Delete "${FILENAME_2}"
	Rename "${FILENAME_1}" "${FILENAME_2}"
!macroend

!macro GMF_Delete FILENAME
	IfFileExists "${FILENAME}" "" +2
	Delete "${FILENAME}"
!macroend

###################################
##          Инсталляция          ##
###################################

Section "Основные файлы" SecMain
	SectionIn RO

	!insertmacro GMF_Delete "$INSTDIR\data\ModVdf\GRF_hard.mod"

	CreateDirectory "$INSTDIR\saves_gothic_russobitm_fix\current"

	SetOutPath "$INSTDIR\data\ModVdf"
	File "GRF_main.mod"

	SetOutPath "$INSTDIR\system"
	File "Gothic_RussobitM_Fix.ico"
	File "Gothic_RussobitM_Fix.ini"
	File "Gothic_RussobitM_Fix.rtf"

	SetOutPath "$INSTDIR"
	File "Gothic_RussobitM_Fix_ReadMe.txt"
	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"
	
	WriteRegStr HKCU "Software\${MOD_NAME}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayName" "${MOD_NAME}" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayVersion" "${MOD_DETAILED_VERSION}" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "InstallLocation" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "HelpLink" "http://worldofplayers.ru/threads/39062"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayIcon" "$INSTDIR\system\Gothic_RussobitM_Fix.ico"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "EstimatedSize" "165000"

	IfFileExists "$INSTDIR\system\GothicStarter.exe" file_found file_not_found
	file_found:
	CreateShortCut "$DESKTOP\${MOD_NAME}.lnk" "$INSTDIR\system\GothicStarter.exe" "-start -game:Gothic_RussobitM_Fix.ini"  "$INSTDIR\system\Gothic_RussobitM_Fix.ico"
	goto end_of_test
	file_not_found:
;;;	MessageBox MB_OK "стартера нет"
	SetOutPath "$INSTDIR\system"
	File "Gothic_RussobitM_Fix.exe"
	File "GothicMod.exe"
	CreateShortCut "$DESKTOP\${MOD_NAME}.lnk" "$INSTDIR\system\Gothic_RussobitM_Fix.exe" "-start -game:Gothic_RussobitM_Fix.ini"  "$INSTDIR\system\Gothic_RussobitM_Fix.ico"
	end_of_test:

SectionEnd

Section "Улучшенные модели" SecAdditional_1

	SetOutPath "$INSTDIR\data\ModVdf"
	File "GRF_models.mod"

SectionEnd

Section "Широкоформатный монитор" SecAdditional_2

	SetOutPath "$INSTDIR\data\ModVdf"
	File "GRF_widescreen.mod"

SectionEnd

Section /o "Повышенная сложность" SecAdditional_3

	SetOutPath "$INSTDIR\data\ModVdf"
	File "GRF_hard.mod"

SectionEnd

###################################
##         Деинсталляция         ##
###################################

Section "Un.Удалить ${MOD_NAME}" SecUninstall_Main
	SectionIn RO
	Call Un.GMF_Delete_Components
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"
SectionEnd

Section /o "Un.Удалить сохранения" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_gothic_russobitm_fix"
SectionEnd

###################################
##     Описание компонентов      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "Основные компоненты Gothic Russobit-M Fix."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "Выберите, если хотите установить улучшенные модели предметов интерьера, природы и инвентаря."
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "Выберите, если у вас широкоформатный монитор (16х9 или 16х10)."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "Альтернативный баланс: значительно меньше руды и опыта, пониженные стартовые характеристики."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_1} $(DESC_SecAdditional_1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_2} $(DESC_SecAdditional_2)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_3} $(DESC_SecAdditional_3)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

LangString DESC_SecUninstall_Main ${LANG_RUSSIAN} "Удаление Gothic Russobit-M Fix."
LangString DESC_SecUninstall_Saves ${LANG_RUSSIAN} "Выберите эту опцию, если хотите удалить папку с сохранениями ${MOD_NAME}."

!insertmacro MUI_UNFUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecUninstall_Main} $(DESC_SecUninstall_Main)
!insertmacro MUI_DESCRIPTION_TEXT ${SecUninstall_Saves} $(DESC_SecUninstall_Saves)
!insertmacro MUI_UNFUNCTION_DESCRIPTION_END

###################################
##            Функции            ##
###################################

Function .onInit
	SetSilent normal
	!insertmacro MUI_LANGDLL_DISPLAY
	ReadRegStr $INSTDIR HKCU "Software\${MOD_NAME}" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	ReadRegStr $INSTDIR HKCU "Software\Piranha Bytes\Player-Kit" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	ReadRegStr $INSTDIR HKLM "Software\Russobit-M\Gothic" "ProgramPath"
	StrCpy $INSTDIR $INSTDIR -7
	StrCmp $INSTDIR "" "" InstallPathIsFound
	StrCpy $INSTDIR "$PROGRAMFILES\Russobit-M\Gothic"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd

Function Un.GMF_Delete_Components
	!insertmacro GMF_Delete "$INSTDIR\system\Gothic_RussobitM_Fix.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\Gothic_RussobitM_Fix.ico"
	!insertmacro GMF_Delete "$INSTDIR\system\Gothic_RussobitM_Fix.ini"
	!insertmacro GMF_Delete "$INSTDIR\system\Gothic_RussobitM_Fix.rtf"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\GRF_main.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\GRF_hard.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\GRF_models.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\GRF_widescreen.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\GRF_hotfix.mod"
	!insertmacro GMF_Delete "$INSTDIR\Gothic_RussobitM_Fix_ReadMe.txt"
	!insertmacro GMF_Delete "$DESKTOP\${MOD_NAME}.lnk"
FunctionEnd