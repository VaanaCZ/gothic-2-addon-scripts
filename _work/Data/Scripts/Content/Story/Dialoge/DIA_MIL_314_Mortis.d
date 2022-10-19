///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mortis_EXIT   (C_INFO)
{
	npc         = Mil_314_Mortis;
	nr          = 999;
	condition   = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Hallo_Condition;
	information	 = 	DIA_Mortis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Mortis_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Mortis_Hallo_13_00"); //Co chce�? Peck tady nen�. Tak�e nic nedostane�. P�ij� pozd�ji.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Waffe_Condition;
	information	 = 	DIA_Mortis_Waffe_Info;
	permanent    =  FALSE;
	description  =  "Kde je Peck?";
};

func int DIA_Mortis_Waffe_Condition ()
{	
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Waffe_15_00"); //Kde je Peck?
	AI_Output (self, other, "DIA_Mortis_Waffe_13_01"); //Jsi u n�s nov�, co? V tom p��pad� v�tej mezi n�mi.
	AI_Output (self, other, "DIA_Mortis_Waffe_13_02"); //Peck u� je ve m�st� v�n� dost dlouho. Vsad�m se, �e se zase mot� kolem t� sla�ou�k� Vanji u �erven� lucerny.
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Paket_Condition;
	information	 = 	DIA_Mortis_Paket_Info;
	permanent    =  FALSE;
	description  =  "Co v� o tom bal�ku ba�inn�ho b�l�?";
};

func int DIA_Mortis_Paket_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Paket_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Paket_15_00"); //Co v� o tom bal�ku tr�vy z ba�in?
	AI_Output (self, other, "DIA_Mortis_Paket_13_01"); //Hm... kdy� jsem byl posledn� v p��stavn� kr�m�, sly�el jsem, jak se o n�m bav� Kardif s n�jak�m dal��m chlap�kem.
	AI_Output (other, self, "DIA_Mortis_Paket_15_02"); //Kdo byl ten druhej chl�pek?
	AI_Output (self, other, "DIA_Mortis_Paket_13_03"); //Nem�m tu�en�. Ale ��kal, �e pro sv� rostlinky na�el nejlep�� mo�n� m�sto - pak se oba za�ali chl�mat jako opil� sk�eti.
	
	B_LogEntry (TOPIC_WAREHOUSE,"Mortis zaslechl, jak se hospodsk� Kardif v p��stavn� kr�m� domlouv� s n�jak�m dal��m mu�em o bal�ku tr�vy. Dohadovali se o tom, kde ji uskladnit.");
};
///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Redlight_Condition;
	information	 = 	DIA_Mortis_Redlight_Info;
	permanent    =  FALSE;
	description  =  "Co v� o p��stavn� �tvrti?";
};

func int DIA_Mortis_Redlight_Condition ()
{	
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Redlight_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Redlight_15_00"); //Co v� o p��stavn� �tvrti? R�d bych na�el toho, kdo tu tr�vu z ba�in prod�v�.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_01"); //Nooo, ti chl�pci odtamtud toho moc nenamluv�, a rozhodn� ne�eknou nic n�komu, kdo je od m�stsk� str�e.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_02"); //Jestli chce� tam dole n�co zjistit, m�l bys - ne, MUS͊ - si sundat brn�n�.
	AI_Output (other, self, "DIA_Mortis_Redlight_15_03"); //Dobr�, a potom?
	AI_Output (self, other, "DIA_Mortis_Redlight_13_04"); //Nejlep�� asi bude zaj�t do kr�my a bordelu. Jestli se n�kde n�co dozv�, tak pr�v� tam.
	
	B_LogEntry (TOPIC_REDLIGHT,"Mortis se domn�v�, �e kdy� si budu cht�t v p��stavu koupit tr�vu, rad�i bych na sob� nem�l m�t ��dnou zbroj. Nejsp� bych to m�l zkusit v kr�m� nebo v nev�stinci.");
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  5;
	condition	 = 	DIA_Mortis_CanTeach_Condition;
	information	 = 	DIA_Mortis_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Chci se st�t siln�j��m.";
};

func int DIA_Mortis_CanTeach_Condition ()
{	
	if (Mortis_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Mortis_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_CanTeach_15_00"); //Chci se st�t siln�j��m.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_01"); //Jasn�. Jestli jsi dost zku�en�, m��u ti pomoci s tr�ninkem.
		Mortis_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_02"); //Jasn� �e bys cht�l. Ale proto�e nejsi ani jeden z n�s, ani paladin, tak z toho nic nebude.
	};
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Mortis, p��slu�n�k m�stsk� gardy, mi m��e pomoci zv��it s�lu.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach		(C_INFO)
{
	npc		  	 = 	Mil_314_Mortis;
	nr			 = 	100;
	condition	 = 	DIA_Mortis_Teach_Condition;
	information	 = 	DIA_Mortis_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci se st�t siln�j��m.";
};
func int DIA_Mortis_Teach_Condition ()
{	
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Mortis_Teach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Teach_15_00"); //Chci se st�t siln�j��m.
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
};
func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Mortis_Teach_13_00"); //U� jsi dost siln�. Jestli chce� tr�novat d�l, mus� se poohl�dnout po n�kom jin�m.
	};
	Info_ClearChoices (DIA_Mortis_TEACH);
};
func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};
func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mortis_PICKPOCKET (C_INFO)
{
	npc			= Mil_314_Mortis;
	nr			= 900;
	condition	= DIA_Mortis_PICKPOCKET_Condition;
	information	= DIA_Mortis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen (38, 60);
};
 
FUNC VOID DIA_Mortis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mortis_PICKPOCKET);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_BACK 		,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};
	
func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};


